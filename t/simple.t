#!/usr/bin/env perl -w
use strict;
use Test::More tests => 3;

use Perl6ish;

sub {
    is(caller->package, 'main');
}->();

ok(main->can('say'));

my @foo = gather {
    take 2;
    take 3;
    take 5;
};
is_deeply(\@foo, [2, 3, 5]);
