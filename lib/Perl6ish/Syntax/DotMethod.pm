package Perl6ish::Syntax::DotMethod;
use strict;
use Sub::Uplevel;

require Acme::Dot;

sub import {
    uplevel 1, \&Acme::Dot::import;
}


1;

