use inc::Module::Install;
name 'Perl6ish';
all_from 'lib/Perl6ish.pm';

requires
    'Perl6::Slurp' => 0.03,
    'Perl6::Caller' => 0.04,
    'Perl6::Take' => 0.04,
    'Variable::Alias' => 0.01,
    'Scalar::Util' => 1.19,
    'Devel::Caller' => 2.03,
    'Devel::Declare' => 0.0304,
    'Devel::BeginLift' => 0.001002,
    'B::Hooks::Parser' => 0.08;

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
