package Operaciones;

=head1 Operaciones

Operaciones - Modulo para realizar operaciones

=head1 SYNOPSIS

    use Operaciones;
    my $result = Operaciones->pot(2,3);
    my $result = Operaciones->percent(50,2000);
    print Operaciones::fact(6);

=head1 DESCRIPTION

Este modulo permite implementar operaciones como
potencia, factorial y porcentaje.

=head2 Methods

=over 12

=item C<pot>
Regresa el primer valor elevado a la potencia del segundo valor.

    my $result = pot($valor,$potencia);


=item C<fact>
Regresa el factorial del valor.

    $my $result = fact($val);

=item C<percent>
Regresa el porcentaje del valor.

    $my $result = percent($porcentaje, $valor);

=back

=head1 AUTHOR

Diana Tadeo
=cut

sub fact{
	$_[0]< 1? return 1: return fact($_[0]-1) * $_[0];
}

sub pot{
	$num=$_[0];
	foreach(1..$_[1]-1){
		$num=$num * $_[0];
	}
	return $num;
}
sub percent{
	return $_[1]*".$_[0]";
}


1;
