#!/usr/bin/env perl -w
use strict;
use Test::More tests => 1;

use Perl6ish;

sub {
    is(caller->package, 'main');
}->();




