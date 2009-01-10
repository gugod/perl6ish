package Perl6ish::Syntax::temp;
use strict;
use warnings;
use Devel::BeginLift qw(temp);
use Data::Dump qw(pp);
use Devel::Declare ();

my $temp;
my %temp;
my @temp;

sub temp {
    my $line = Devel::Declare::get_linestr;
    my $offset = Devel::Declare::get_linestr_offset;

    if ($line =~ /\btemp\s+([\$\@\%\*])(.+)\s*\;\s*$/) {
        my $sigil = $1;
        my $varname = $2;
        my $temp = $sigil . 'Perl6ish::Syntax::temp::temp';
        substr($line, $offset, 0) = ";$temp = $sigil$varname; my $sigil$varname = $temp;";
        Devel::Declare::set_linestr($line);
    } 
}

sub import {
    my $caller = caller;
    no strict;
    *{"$caller\::temp"} = \&temp;
}

1;
