use strict;
package Perl6ish::Array;
use List::Util ();

sub new {
    my $self = ref($_[1]) eq "ARRAY" ? $_[1] : [];
    bless $self, $_[0];
    $self;
}


sub min {
    my ($self) = @_;
    List::Util::min(@$self);
}

sub max {
    my ($self) = @_;
    List::Util::max(@$self);
}


1;

