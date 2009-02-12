package Perl6ish::Syntax::state;
use strict;
use warnings;
use B::Hooks::Parser;

sub import {
    B::Hooks::Parser::inject("use feature 'state';");
}

1;
