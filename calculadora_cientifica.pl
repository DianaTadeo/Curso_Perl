use feature "switch";

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


sub evalua{
	$expr=$_[0];
	$val;
	while($expr=~/fact\(([0-9]+)\)/){
		$val=fact($1);
		$expr=~s/fact\(([0-9]+)\)/$val/;
		print "$expr\n";
	}
	while($expr=~/pot\(([0-9]+),([0-9]+)\)/){
		$val=pot($1,$2);
		$expr=~s/pot\(([0-9]+),([0-9]+)\)/$val/;
		print "$expr\n";
	}
	while($expr=~/cos\(([0-9]+)\)/){
		$val=cos($1);
		$expr=~s/cos\(([0-9]+)\)/$val/;
		print "$expr\n";
	}
	return $expr;
}

$res= &evalua("(fact(4)*(fact(5)+pot(2,10)))* cos(-1)");
print $res;
print "Final= ".eval($res)."\n";
