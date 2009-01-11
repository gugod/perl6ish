package Perl6ish;

use strict;
use warnings;
our $VERSION = '0.01';

sub import {
    my $caller = caller;

    eval <<CODI;
package $caller;
use Perl6::Caller;
use Perl6ish::Syntax::temp;
use Perl6ish::Syntax::state;

CODI

    return 1;
}

1;
__END__

=head1 NAME

Perl6ish - Some Perl6 programming in Perl5 code.

=head1 SYNOPSIS

  use Perl6ish;

=head1 DESCRIPTION

Perl6ish is

=head1 AUTHOR

Kang-min Liu E<lt>gugod@gugod.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
