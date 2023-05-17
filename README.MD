This is hopefully a useful set of examples that will get you started using Fortran and python to write a run script.
I have included all the basic fortran ideas and you should be able to go through the source files and see how each function or
subroutine works. I have included an example make file for use on both arc and your mac.

There are 3 sub directories: 
    src - this contains all of your Fortran source code 
    run - this contains any run scripts it is also where you would put extra input data you may need so the program can move it to the 
          relevant execution folder
    build - this contains your makefile which will create the Fortran executable 

Some basic UNIX commands to use in the terminal 
cd run      this will open the folder run (if it exists) changing run to a different folder name will open a differnet folder
cd ..       this will take you back one directory 
ls          this will show you everything within the current folder
pwd         this will print the current workign directory 


src 
The src directory contains 3 .f90 files 
    main.f90 is your main program file and controls all the processes
    module_example2.f90 is a Module file which contains some global variables and declares a defined type
    module_example.f90 is another Module file which has a dependency on module_example2.f90. This module contains most 
                        of the subroutines and functions the main program uses 

Some Fortran basics

All variables used in a program, subroutine or function need to be declared at the beginning of the routine.
Variables must all have a type: 
* Integer
* Real 
* Character 
* Complex 
* Boolean
* User declared type 

Additionally, they can be declared as arrays: 
dimension(10) 	sets up a 1D array of size ten
dimension(:,:) 	a 2D array of assumed size 
dimension(:,:,:),allocatable 	a 3D array which can be allocated later

Generally it is best to allocate and deallocate arrays as this will ensure better memory management.

Variables can have intent(in/out/inout) which tells the compiler how the variable will be used within a function or subroutine. 

Functions in Fortran must have a declared type so an integer function outputs an integer a real function outputs a real. Subroutines take a set of inputs [or none] and then performs an operation or set of operations. A function will take some inputs and produce a result but will not alter the values of the inputs whereas a subroutine can/will alter values that are input.

Python Control Scripts
I have included a python control script that sets up some random input files; checks some input values and then sets up the relevant execution folder. I have also included an example of how a submission script can be automatically written if/when you are submitting jobs to the arc high performance computer. This will not be relevant at first but I have included it for sake of completeness. 
To run the python script put the terminal into the run folder then use the command 

    python run.py 

Makefile

There are two makefiles one for your mac and another for arc. The control script selects the relevant makefile and then copies it to the file "Makefile" naming the file this allows your computer to recognise the file as a makefile and then allows the command "make" to be used which will build the executable file. The command "make clean" will clear all objects in the build folder. This is useful if there have been issues compiling code and you want to ensure all of your files are compiled correctly from your current save. the ".mod" files created are to be expected and will not be readable.
