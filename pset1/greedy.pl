use strict;
use warnings;
use POSIX();

sub main {

  my ($change_due, $change_in_cents, $number_of_cents);
  my $number_of_coins = 0;

  do {
    print "How much change is owed?\n";
    $change_due = <STDIN>;
    chomp $change_due;
  } while ($change_due !~ /\A\d*(\.\d{0,2})?\z/ || $change_due < 0);

  if ($change_due == 0) {
    print "$number_of_coins\n";
  }
  else {
    $change_in_cents = $change_due * 100;
    $number_of_cents = $change_in_cents;

    while ($number_of_cents >= 25) {
      my $coins = POSIX::floor(($number_of_cents) / 25);
      $number_of_coins += $coins;
      $number_of_cents = $number_of_cents % 25;
    }
    while ($number_of_cents >= 10) {
      my $coins = POSIX::floor(($number_of_cents) / 10);
      $number_of_coins += $coins;
      $number_of_cents = $number_of_cents % 10;
    }
    while ($number_of_cents >= 5) {
      my $coins = POSIX::floor(($number_of_cents) / 5);
      $number_of_coins += $coins;
      $number_of_cents = $number_of_cents % 5;
    }
    while ($number_of_cents >= 1) {
      $number_of_coins += $number_of_cents;
      $number_of_cents = 0;
    }
    print "$number_of_coins\n";
  }
}

main();

# for (my $i = 0; $i < $height; $i++) {
#   for (my $j = 0; $j < $height-($i+1); $j++) {
#     print " ";
#   }
#   for (my $k = 0; $k < $i+2; $k++) {
#     print "#";
#   }
#   print "\n";
# }