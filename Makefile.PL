use inc::Module::Install;
name 'Perl6ish';
all_from 'lib/Perl6ish.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
