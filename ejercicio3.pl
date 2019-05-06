#!/usr/bin/perl -w
use strict;
use GD;  
use GD::Graph::bars;


open(IH, "info_habitantesm2.txt") or die "No se pudo analizar el archivo.";
my @paises;
my @cantidad;
#my @data;
foreach my $line (<IH>){
	if ($line =~ /[0-9]+\t([a-zA-Z\s]+)\t(.+)/){
		#print "pais: $1	";
		#print "cantidad: $2 \n";
		push @paises,$1;
		push @cantidad,$2;
	}
}

close(IH);

my @data = (\@paises, \@cantidad);
my $graph = new GD::Graph::bars(1200,700);

$graph->set(
    title             => "Densidad de poblacion por pais",
    x_label           => 'Paises',
    y_label           => 'Habitantes por Km2'
    );

my $gd = $graph->plot( \@data );

open (OUT, '>',"Densidad_de_Poblacion.png") or die "No se pudo crear el archivo: $!";
binmode(OUT);
print OUT $gd->png( );
close OUT;