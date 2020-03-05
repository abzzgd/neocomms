#!/usr/bin/perl


my %arb = (
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000,
);

my $a = <STDIN>;
chomp($a);

my @spl = (split('',$a));
 
my $odinary_number = 0;
for my $i (0..$#spl-1) {
  if ( $arb{$spl[$i]} <  $arb{$spl[$i+1]}) {
    $odinary_number -= $arb{$spl[$i]};
  } else {
    $odinary_number += $arb{$spl[$i]};
  }
}
$odinary_number += $arb{$spl[$#spl]};

print $odinary_number;



