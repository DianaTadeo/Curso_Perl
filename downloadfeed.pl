#!/usr/bin/perl

#Autor: Diana Tadeo
#Ejercicio 1.
while (1){
	$response = `curl https://openphish.com/feed.txt> feed.txt`;
	sleep(300);
	print "Han pasado 5 minutos\n";
}
