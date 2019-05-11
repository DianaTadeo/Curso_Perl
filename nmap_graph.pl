#!/usr/bin/perl
use GD;      # for font names
use GD::Graph::mixed;
use strict;

open(FD, "nmap_report.txt") or die "No se pudo analizar el archivo.";

my @eje_x;
my @eje_y;
my $name="";
foreach (<FD>){
	chomp ;
	if ($_ =~ /: /){
		my $left= $`;
		my $right= $';
		if ($left =~ /OPEN/){
			$name="OPEN";
			next;
		}
		if ($left =~ /CLOSED/){
			$name="CLOSED";
			next;
		}
		if ($left =~ /CLOSED/){
			$name="CLOSED";
			next;
		}
		print "$name$left $right\n";
		push @eje_x,"$name$left";
		push @eje_y,$right;
	}
}

close(FD);

my @data = (\@eje_x, \@eje_y);
my $graph = new GD::Graph::bars(1000,700);

$graph->set(
    title             => "Datos de la red $ARGV[0]",
    x_label           => 'Datos',
    y_label           => 'Cantidad'
    );

my $gd = $graph->plot( \@data );

open (OUT, '>',"Nmap_Graph.jpeg") or die "No se pudo crear el archivo: $!";
binmode(OUT);
print OUT $gd->jpeg( );
close OUT;
