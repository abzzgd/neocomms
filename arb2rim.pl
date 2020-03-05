#!/usr/bin/perl

my %rim = ('1'    => 'I',
           '5'    => 'V', 
           '10'   => 'X', 
           '50'   => 'L', 
           '100'  => 'C', 
           '500'  => 'D', 
           '1000' => 'M', 
           '5000' => "\x{2181}",
           '10000'=> "\x{2182}", 
);

my $d1 = 1;
my $d5 = 5;


my $arb_number = <STDIN>;
chomp($arb_number);
my @spl  = reverse split //,$arb_number;

my $rim_number;
foreach my $arb_dgt (@spl) {
  if ($arb_dgt le '3') {
    $rim_number =  $rim{$d1}x$arb_dgt.$rim_number;
  } elsif ($arb_dgt eq '4')  {
    $rim_number =  $rim{$d1}.$rim{$d5}.$rim_number;
  } elsif ($arb_dgt le '8') { 
    unshift @rim_spl, , $rim{$d1}x($arb_dgt-5);
    $rim_number = $rim{$d5}.$rim{$d1}x($arb_dgt-5).$rim_number;
  } elsif ($arb_dgt eq '9')  { 
    $rim_number =  $rim{$d1}.$rim{$d1*10}.$rim_number;
  } 
  $d1 *= 10;
  $d5 *= 10;
}
print $rim_number,"\n";

