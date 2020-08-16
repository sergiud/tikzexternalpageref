use strict;
use warnings;

my $protected = "";

while ($_ = <>) {
  # Prepend \protect to each command. Make an exception for \thepage, since we
  # want the token to be correctly expanded at page shipout.
  $_ =~ s/(\\(?!(thepage|}|\\)))/\\protect$1/g;
  # Protect newlines (\\).
  $_ =~ s|\\\\|\\protect\\\\|g;
  # Prepend \string to # to avoid parameter number expansion.
  $_ =~ s/(#)/\\string$1/g;
  # For cosmetic reasons, remove the trailing newline to avoid a lone } at the
  # end-of-file.
  $_ =~ s|\n||g;

  $protected .= $_;
}

print '\toks0={', $protected, "}\n";
