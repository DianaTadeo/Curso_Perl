#!/usr/bin/perl
use LWP::Simple;

open(INFO, "feed.txt") or die ("No se pudo abrir el archivo\n");
open(FH, '>',"sitios_activos.txt") or die ("No se pudo abrir el archivo");
foreach $line (<INFO>){
	$response = get($line);
	if (! defined $response){
		print "Sitio no activo:  $line";
	}else{
		print FH "$line";
	}
}
close(INFO);
close(FH);
