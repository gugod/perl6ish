package Perl6ish::Syntax::state;
use strict;
use warnings;
use Scalar::Util qw(refaddr);
use Devel::Caller qw(caller_args called_with caller_vars caller_cv);

use Data::Dump qw(pp);

use Devel::Declare;
use Variable::Alias ();

our ($Declarator, $Offset);

sub skip_declarator {
    $Offset += Devel::Declare::toke_move_past_token($Offset);
}

my %stash = ();

sub handle_state {
    my $line = Devel::Declare::get_linestr;
    $Offset = Devel::Declare::get_linestr_offset;

    if (my ($statement, $sigil, $name, $val) = $line =~ /(\bstate\s+([\$\@\%])(\w+)\s*=\s*(.+);)/) {
        skip_declarator;

        my $var = "$sigil$name";
        my $stash_var = "\$Perl6ish::Syntax::state::stash{'$var'}";

        # substr( $line, $Offset, length($statement) ) = "my $var; $stash_var ||= $val; $var = $stash_var; Variable::Alias::alias( $var, $stash_var ); ";

        substr( $line, $Offset, length($statement) ) = "(my $var, $val);";

        # pp "XXX $line";

        Devel::Declare::set_linestr($line);
    }
}

sub state(\$$) {
    my ($varref, $varval) = @_;
    my $varname = (called_with(0, 1))[0];
    my $caller_addr = refaddr( caller_cv(1) );
    my $k = "$caller_addr $varname";
    $$varref = $stash{ $k } ||= $varval;

    Variable::Alias::alias( $$varref, $stash{ $k } );
};

sub import {
    my $caller = caller;
    no strict;
    *{"$caller\::state"} = \&state;

    Devel::Declare->setup_for(
        $caller => { state => { const => \&handle_state } }
    );
}

1;
