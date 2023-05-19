# Makefile for use on chmlinxx computers.
# Adapted from make file written by C. Symmonds for the MCE program which was inturn
# made with the aid of the fmkmf utility (Copyright (c) The University of Edinburgh)
# subsequent streamlining alterations have been made 

F90=gfortran #This is the fortran compiler used
FFLAGS= -g #This flag is used to debug the code other flags include -fopenmp which allows parallelisation
FLINKS= -llapack -lblas #This flag allows the linker to link to the lapack and blas libraries
VPATH=../src #This is the path to the source files

# Link step

all: test.exe #This is the executable that will be made

test.exe: module_example.o module_example2.o main.o #These are the object files that will be linked to make the executable
		 $(F90) $(FFLAGS) -o $@ $^ $(FLINKS)


# Compile steps

module_example2.o:module_example2.f90 #module_example2.f90 has no dependancies so can be compiled first
	 $(F90) $(FFLAGS) -c $<  
#$< is a special variable that refers to the first dependancy in the list
#so in this case $< is module_example2.f90
#module_example2.f90 is compiled to module_example2.o
#module_example2.o is then used in the next step

module_example.o:module_example.f90 module_example2.o #module_example.f90 depends on module_example2.o so must be compiled after
	 $(F90) $(FFLAGS) -c $<
#module_example.f90 is compiled to module_example.o
#module_example.o is then used in the next step

main.o:main.f90 module_example.o module_example2.o #main.f90 depends on module_example.o and module_example2.o so must be compiled after
	 $(F90) $(FFLAGS) -c $<

# This entry allows you to type " make clean " to get rid of
# all object and module files

clean:
	rm -rf f_{files,modd}* *.o *.mod *.exe *~ ../run/*.exe ../run/*~ ../src/*~