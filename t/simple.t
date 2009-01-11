#!/usr/bin/env perl -w
use strict;
use Test::More tests => 2;

use Perl6ish;

sub {
    is(caller->package, 'main');
}->();

ok(main->can('say'));




