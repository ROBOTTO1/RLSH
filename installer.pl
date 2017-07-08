#Script wrote by Cristian Simón and distributed under the RLSH license,
#that can be founded in the package.
#!/usr/bin/perl --
BEGIN {
	use File::Spec::Functions qw(rel2abs);
	use File::Basename qw(dirname);
	my $path   = rel2abs( $0 );
	our $directory = dirname( $path );
}

use Config;
use POSIX;
use Sys::Hostname;
use Term::ANSIColor;
use File::ReadBackwards;
use File::Copy;

#finished importing, that ammount of modules to ensure that the shell wont 
#need anyone in future

#variables (arch, etc)
my $OS = "$Config{osname}";
my $ARCH = "$Config{archname}";
#procesing
print "Welcome to RLSH Installer!\n";
print "--------------------------\n";
print "Root is needed to run this installation\n";
print "We strongly recommend read the README, INSTALL and LICENSE files before\n";
print "install the restarted line shell\n";
sleep(10);
print "If you want to know what exactly this process do, you can just\n";
print "revise the code or read the documentation installed in /usr/share/doc/rlsh\n";
sleep(20);
print "Starting shell instalation, we will need some things...\n";
print "###################################################\n";
print "Instalation prefix?(we strongly recommend /usr/bin, the libraries will be installed in /usr/lib)\n";
print "Provide a full path please, avoid constructions like usr/bin to do a good installation, just like the example\n";
print "Example was (/usr/bin)\n";
print "		[Decision]>>";
my $prefix = <STDIN>;
chomp $prefix;
print "Decision = $prefix\n";
print "Do you want to build documentation?(yes or no)\n";
print "		[Decision]>>";
my $documentation = <STDIN>;
chomp $documentation;
print "Decision = $documentation\n";
if ($documentation eq "yes") {
	my $doc_build = "yes";
}
elsif ($documentation eq "no") {
	my $doc_build = "no";
}
else {
	print "The answer wasnt yes or no, we setted it automatically to yes\n";
	my $doc_build = "yes";
}
sleep(10);
print "We are done here, wait until the process ends, and you will have your\n";
print "shinny new shell!, here you can revise the information we recopiled\n";
print "Information:\n";
print "		Arch = $ARCH\n";
print "		OS   = $OS\n";
print "Documentation? = $documentation\n";
print "Prefix? = $prefix\n";
print "############################################################\n";
print "You can press Ctrl + C if you want to stop the setup\n";
print "You have 20 seconds\n";
sleep(20);
print "Starting process\n";
print color('yellow');
print "Step 1: Coping and moving the init file to prefix:\n";
print color('reset');
copy("init.pl","rlsh.pl") or die "Copy failed: $!";
system "chmod", "+x", "rlsh.pl";
move("$directory/rlsh.pl","$prefix/rlsh");
print color('green');
print "Step 1: SUCESS\n";
print color('reset');
print color('yellow');
print "Step 2: Making libraries\n";
print color('reset');
system("mkdir /usr/lib/rlsh");
my $builtin = "$directory/builtin";
my $libr = "$directory/lib";
my $builtin_dest = "/usr/lib/rlsh/builtin";
my $libr_dest = "/usr/lib/rlsh/lib";
move("$builtin", "$builtin_dest") or die "Cannot move scripts, are you root?: $!\n";
move("$libr", "$libr_dest") or die "Cannot move scripts, are you root?: $!\n";
print color('green');
print "Step 2: SUCESS\n";
print color('reset');
if ($doc_build eq "yes"){
	print color('yellow');
	print "building documentation\n";
	print color('reset');
	move("$directory/doc/", "/usr/share/doc/rlsh") or die "Cannot copy documentation: $!\n";
	print color('green');
	print "Documentation: SUCESS\n";
	print color('reset');
}
print "We finished here, good luck!\n";
print "support mail: assemblyislaw@gmail.com\n";

