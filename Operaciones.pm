package Operaciones;

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
