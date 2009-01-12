use strict;
package Perl6ish::Array;
use List::Util ();

sub xx {
    my ($self, $n) = @_;
    my @ret = ();
    for(1..$n) {
        push @ret, @{$self}
    }
    return \@ret;
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

