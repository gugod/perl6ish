#!/usr/bin/env perl -w
use strict;
use Test::More tests => 6;
use Perl6ish::Syntax::state;
use Data::Dump qw(pp);

sub counter {
    state $n = 0;
    # state2(my $n, 0);

    $n++;
    return $n;
}

is counter(), 1;
is counter(), 2;
is counter(), 3;

sub counter2 {
    state $n = 10;
    # state2(my $n, 10);

    $n++;
    return $n;
}
is counter2(), 11;
is counter2(), 12;
is counter2(), 13;
