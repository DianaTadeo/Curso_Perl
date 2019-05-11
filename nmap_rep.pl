#!perl
use strict;

open(FD, "nmap $ARGV[0]|") or die "No se pudo ejecutar.\n";

my $num_hostsUp=0;
my $numTCP=0;
my $numUDP=0;
my %port_open; #Hash con los puertos abiertos
my %port_closed; #Hash con los puertos cerrados
my %port_other; #Hash con los puertos filtrados u otro
foreach (<FD>){
	chomp;
	if ($_ =~ /([0-9]+)\/(tcp|udp)[\s]+(.*)[\s]+(.*)/){ #busca los puertos con el formato del tipo '135/tcp open  msrpc'
		my $val1=$1;
		my $val2=$2;
		my $val3=$3;
		my $val4 =$4;
		
		$numTCP++ if $val2=~/tcp/; #cuenta si es tcp
		$numUDP++ if $val2=~/udp/; #cuenta si es udp
		if($val3=~/open/){ #si el puerto est[a abierto
			if($port_open{"$val1/$val4"}==undef){
				$port_open{"$val1/$val4"}=1
			}else{
				my $aux=$port_open{"$val1/$val4"};
				$port_open{"$val1/$val4"}=++$aux;
			}
		}
		elsif ($val3=~/closed/){#si el puerto esta cerrado
			if($port_closed{"$val1/$val4"}==undef){
				$port_closed{"$val1/$val4"}=1
			}else{
				my $aux=$port_closed{"$val1/$val4"};
				$port_closed{"$val1/$val4"}=++$aux;
			}
		}
		else{ #Si el puerto est[a filtrado u otro
			if($port_other{"$val1/$val4"}==undef){
				$port_other{"$val1/$val4"}=1
			}else{
				my $aux=$port_other{"$val1/$val4"};
				$port_other{"$val1/$val4"}=++$aux;
			}
		}
	}
	$num_hostsUp++ if $_ =~/Host is up/; #Cuenta los host arriba
}
close (FD);
#Se escriben los datos en "nmap_report.txt"
my $numOpen=scalar keys %port_open;
my $numClosed=scalar keys %port_closed;
my $numOther=scalar keys %port_other;
open(REPORTE, '>', "nmap_report.txt" ) or die "No se pudo crear el archivo";
print REPORTE "HOST: $num_hostsUp\n";
print REPORTE "TCP: $numTCP\n";
print REPORTE "UDP: $numUDP\n";
print REPORTE "-OPEN PORT'S: $numOpen\n";
foreach(keys %port_open){
	print REPORTE "$_: $port_open{$_}\n";
}
print REPORTE "-CLOSED PORT'S: $numClosed\n";
foreach(keys %port_closed){
	print REPORTE "$_: $port_open{$_}\n\n";
}
print REPORTE "-OTHER: $numOther\n";
foreach(keys %port_closed){
	print REPORTE "$_: $port_open{$_}\n\n";
}

close(REPORTE);
