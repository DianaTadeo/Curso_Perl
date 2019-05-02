#!/usr/bin/perl

#Autor: Diana Tadeo
#Deben de ejecutarse losscripts de otros ejercicios antes
#Ejercicio 4 terminado.
#Ejercicio 5 incompleto.
open(FH, "ejemplo.txt") or die ("No se pudo abrir el archivo\n");
@domains=();
%existentes={};
foreach $line (<FH>){
	if($line =~ /(https*:\/\/.*\.[a-z]{2,})(\/.*)/){
		if ( grep { $_ eq $1 } @domains){
			#$n=$1;
			#chop($n);
			#chop($line);
			#@temp= $existentes{$n};
			#push(@temp, $line);
			#$existentes{$n}=@temp;
			print "ya existe $1\n";
		}else{
			#$n=$1;
			#chop($n);
			#chop($line);
			#$existentes{$n} = ($line);
			push(@domains, $1);
			print "No existia $1\n";
		}
	}
}
open(FH, "sitios_activos.txt") or die ("No se pudo abrir el archivo\n");
chomp(@lines = <FH>);
close(FH);

for ($i=0;$i<=$#domains;$i++){
	@url=();
	for ($al=0;$al<=$#lines;$al++){
		$res=$domains[$i];
		$r=$lines[$al];
		if($lines[$al] =~/$res/){
			push(@url, $r);
			print "E: $r\n";
		}
	}
	$existentes{$domains[$i]}=$url;
}


