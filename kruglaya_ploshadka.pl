#!/usr/bin/perl

use POSIX;

print "введите радиус: ";
my $r = <STDIN>;

# все вычисления производим для четверти круга, результаты в конце умножим на 4;
my $col = $row = int($r/sqrt(2)); # начинаем с середины четверти круга 
my $spl = 1;         # колотые блоки
my $whl = $col*$row; # целые   блоки

$col++;
while ($row > 0) {
  my $hp = sqrt( $row**2 + $col**2 );  # гипотенуза
  if ( $hp > $r ) {
    $spl+=2;
    $row--;
  } else {
    $whl += $row*2;
    $col++;
    $spl+=2 if $hp != $r; 
  }
}
if ($col < $r) { $spl += 2; }

print "целые : ", 4*$whl, "\t", "колотые : ", 4*$spl, "\n";


