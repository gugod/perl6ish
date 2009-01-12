#!/usr/bin/env perl
use strict;
use Test::More tests => 2;

use Perl6ish;
use Perl6ish::Autobox;

my $a = [1, 3, 2];
is( $a->min, 1 );
is( $a->max, 3 );

