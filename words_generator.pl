#!/usr/bin/perl
print "Ingresa un numero\n";
$entrada = <stdin>;
@palabras = ("hola","hello","hallo","bye","ciao", "Olá", "Hej", "Kaixo", "Ola", "Aloha", "Merhaba", "Habari", "ziua", "Ahoj", "Sveiki", "privyt", "Tere", "Namaste", "Aloha", "Salam");

for ($i=0;$i<$entrada; $i++){
	$elegido = int(rand(19));
	print $palabras[$elegido]." ";
}

print "\n";
