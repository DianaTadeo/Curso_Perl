#!/usr/bin/perl
use LWP::Simple;

open(FH, "sitios_activos.txt") or die ("No se pudo abrir el archivo\n");
@palabras = ("password", "pass", "mail", "email", "user", "username", "usuario", "login", "send", "name", "account", "serial", "credit");

$file = FH;
chomp(@lines = <$file>);
@sites=();
$size= scalar @lines;
for ($i=0;$i<5;$i++){
	push(@sites,@lines[int(rand($size-1))]);
}
foreach $site (@sites){
	print "Se revisa: $site\n";
	foreach $palabra (@palabras){
		$response = get($site);
		if ($response =~ /$palabra/){
			print "Se encontro $palabra\n";
		}
	}

}
