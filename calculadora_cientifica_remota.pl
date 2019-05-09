use feature "switch";
use Math::Trig;
use strict;
use IO::Socket::INET;
use lib ".";
require Operaciones;

sub despliegaMenu{
	my $cad="";
		$cad=$cad. "-------------------Operaciones------------------\n";
		$cad=$cad. "- Las operaciones aceptadas son                -\n";
		$cad=$cad. "-                                              -\n";
		$cad=$cad. "-    Suma: num + num                           -\n";
		$cad=$cad. "-    Resta: num - num                          -\n";
		$cad=$cad. "-    Multiplicacion: num * num                 -\n";
		$cad=$cad. "-    Division: num / num                       -\n";
		$cad=$cad. "-    Factorial: fact(num)                      -\n";
		$cad=$cad. "-    Potencia: pot(num, potencia)              -\n";
		$cad=$cad. "-    Porcentaje: percent(porcentaje, num)      -\n";
		$cad=$cad. "-    Modulo: num % mod                         -\n";
		$cad=$cad. "-    Potencia: pot(num, potencia)              -\n";
		$cad=$cad. "-    Seno: sin(num)                            -\n";
		$cad=$cad. "-    Coseno: cos(num)                          -\n";
		$cad=$cad. "-    Tangente: tan(num)                        -\n";
		$cad=$cad. "-    Cotangente: cot(num)                      -\n";
		$cad=$cad. "-    Secante: sec(num)                         -\n";
		$cad=$cad. "-    Cosecante: csc(num)                       -\n";
		$cad=$cad. "------------------------------------------------\n";
		
	return $cad;
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
	return eval($expr);
}

my $socket = new IO::Socket::INET (
    LocalHost => '0.0.0.0',
    LocalPort => '7777',
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
);
die "No se pudo crear el socket $!\n" unless $socket;
print "sServidor a la escucha por el puerto 7777\n";

while(1){
    my $client_socket = $socket->accept();
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();
    print "connection from $client_address:$client_port\n";
	$client_socket->send(&despliegaMenu);
    my $expresion="";
    $client_socket->recv($expresion, 1024);
    my $resp="Res= ".evalua($expresion)."\n";
	$client_socket->send($resp);
	shutdown($client_socket, 1);
}
$socket->close();

