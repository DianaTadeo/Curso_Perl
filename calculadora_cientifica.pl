use feature "switch";
use Math::Trig;
use strict;
use lib ".";
require Operaciones;

sub despliegaMenu{
		print "-------------------Operaciones------------------\n";
		print "- Las operaciones aceptadas son                -\n";
		print "-                                              -\n";
		print "-    Suma: num + num                           -\n";
		print "-    Resta: num - num                          -\n";
		print "-    Multiplicacion: num * num                 -\n";
		print "-    Division: num / num                       -\n";
		print "-    Factorial: fact(num)                      -\n";
		print "-    Potencia: pot(num, potencia)              -\n";
		print "-    Porcentaje: percent(porcentaje, num)      -\n";
		print "-    Modulo: num % mod                         -\n";
		print "-    Potencia: pot(num, potencia)              -\n";
		print "-    Seno: sin(num)                            -\n";
		print "-    Coseno: cos(num)                          -\n";
		print "-    Tangente: tan(num)                        -\n";
		print "-    Cotangente: cot(num)                      -\n";
		print "-    Secante: sec(num)                         -\n";
		print "-    Cosecante: csc(num)                       -\n";
		print "------------------------------------------------\n";
}

sub evalua{
	my $expr=$_[0];
	my $val;
	while($expr=~/fact\(([0-9]+)\)/){
		$val=Operaciones::fact($1);
		$expr=~s/fact\(([0-9]+)\)/$val/;
	}
	while($expr=~/pot\(([0-9]+),([0-9]+)\)/){
		$val=Operaciones::pot($1,$2);
		$expr=~s/pot\(([0-9]+),([0-9]+)\)/$val/;
	}
	while($expr=~/cos\(([0-9]+)\)/){
		$val=cos($1);
		$expr=~s/cos\(([0-9]+)\)/$val/;
	}
	while($expr=~/sin\(([0-9]+)\)/){
		$val=sin($1);
		$expr=~s/sin\(([0-9]+)\)/$val/;
	}
	while($expr=~/tan\(([0-9]+)\)/){
		$val=tan($1);
		$expr=~s/tan\(([0-9]+)\)/$val/;
	}
	while($expr=~/cot\(([0-9]+)\)/){
		$val=cot($1);
		$expr=~s/cot\(([0-9]+)\)/$val/;
	}
	while($expr=~/sec\(([0-9]+)\)/){
		$val=sec($1);
		$expr=~s/sec\(([0-9]+)\)/$val/;
	}
	while($expr=~/csc\(([0-9]+)\)/){
		$val=csc($1);
		$expr=~s/csc\(([0-9]+)\)/$val/;
	}
	while($expr=~/sqrt\(([0-9]+)\)/){
		$val=sqrt($1);
		$expr=~s/sqrt\(([0-9]+)\)/$val/;
	}
	while($expr=~/percent\(([0-9]+),([0-9]+)\)/){
		$val=Operaciones::percent($1,$2);
		$expr=~s/percent\(([0-9]+),([0-9]+)\)/$val/;
	}
	return $expr;
}

my $expresion;
if($ARGV[0]==undef){
	&despliegaMenu;
	$expresion = <stdin>;
}else{
	$expresion = $ARGV[0];
}
$expresion=evalua($expresion);

print "Result= ".eval($expresion)."\n";
