# Installing
Installing file for RLSH
## Introduction
RLSH is not instaled via a makefile, it uses a home-made wizard that simplify a lot the process.
## How I install RLSH?
Simple as execute the install.pl script in the package folder as root.
# REQUERIMENTS:
RLSH need a bunch of modules and external packages, as termANSIColor to manage the colored prompt, this packages can
be found in CPAN, by the moment, this is the only way of have the needed packages, we're working in reduce the need
of some packages but this things will need time, this is the list of the modules needed, most of them should be installed
as a basic perl instalation:
- Sys::Hostname (surelly it is installed)
- File::ReadBackwards (surelly need an install)
- File::Copy (maybe need a install)
- Term::ANSIColor (surelly will need an install, some distros like Xubuntu add it by default)
- POSIX (surelly it is installed)
- Config (must be installed already)

I guess we dont need to say that it needs a Perl Compiler, RLSH in the actual version of perl (5.26.0) works perfect and in the
predecessors too, if any incompatibily appear please notify our team to work on it (assemblyislaw@gmail.com).
