
import sys
import inputs
import os
import socket
import getpass
import shutil
import numpy as np
import subprocess
import random
import math 
from functools import reduce
import numpy
import csv


# This is an example run script that will compile the code in src and then run it

#  This checks if the example_number is an integer exists
if(isinstance(inputs.run['example_number'],int)==False):
    sys.exit("This example_number must be an integer")

#  This checks if the code is being run on the HPC or not
Hostname=socket.gethostname()
if((Hostname==("login2.arc4.leeds.ac.uk"))or(Hostname==("login1.arc4.leeds.ac.uk"))or(Hostname==("login2.arc3.leeds.ac.uk"))or(Hostname==("login1.arc3.leeds.ac.uk"))):
    HPCFLG=1
else:
    HPCFLG=0

# This checks if the excution directory exists and if not creates it
if(HPCFLG==0):
    if not os.path.exists("../EXEC"):
        os.mkdir("../EXEC")
    EXDIR="../EXEC"
else:    
    os.environ['LOGNAME']
    EXDIR="/nobackup/"+getpass.getuser()


# Check for the run folder and if it exists ask if you want to delete it by inputing y/n
if os.path.exists(EXDIR+"/"+inputs.run['runfolder']):
    value=input("File already exists do you want to delete it? y/n\n")
    if(value=='y'):
        shutil.rmtree(EXDIR+"/"+inputs.run['runfolder'])
    else:
        sys.exit("Runfolder already exists. Change the Runfolder name or delete/move it")

os.mkdir(EXDIR+"/"+inputs.run['runfolder']) # This creates the run folder
EXDIR1=EXDIR+"/"+inputs.run['runfolder'] # This is the path to the run folder

variables1=np.random.rand(5) # This generates a random array of 5 numbers between 0 and 1
variables2=np.random.rand(2,5) # This generates a random array of 5 numbers between 0 and 1

# This creates a file called variables.txt and writes the variables to it
with open(EXDIR1+"/variables.dat", 'w') as f:
    for i in range(len(variables1)):
        f.write(str(variables1[i])+"\n") # This writes the variables to the file one per row

# This creates a file called example_type_array_values2.csv and writes the variables to it
with open(EXDIR1+"/example_type_array_values.csv", 'w') as f:
    writer = csv.writer(f)
    writer.writerows([variables2[0,:]]) # This writes the first row of variables2 to the csv file
    writer.writerows([variables2[1,:]]) # This writes the second row of variables2 to the csv file

# Notice here that the variables are written as a string. This is because the variables are read in as a string and then converted to a float in the code
# Also python indexing starts at 0 whereas fortran starts at 1

# Now we are going to compile the code

os.chdir("../build") # This changes the directory to the build folder

if(HPCFLG==1): # This checks if the code is being run on the HPC or not
    shutil.copy2("../build/makefile_arc","../build/Makefile") # This copies the makefile_arc_omp to Makefile
    subprocess.run(["make"]) # This runs the makefile
else:
    shutil.copy2("../build/makefile_mac","../build/Makefile") # This copies the makefile_mac to Makefile
    subprocess.run(["make"]) # This runs the makefile


shutil.copy2("test.exe",EXDIR1) # This copies the executable to the run folder

os.chdir(EXDIR1) # This changes the directory to the run folder


# We are now ready to run the code. We will run the code using a submission script if on the HPC or just run the code if not on the HPC
# The submission script is a bash script that is submitted to the queue and runs the code
# The submission script is created in the run folder and then submitted to the queue
# You should read up on the submission script for the HPC you are using and change the submission script accordingly
# https://arcdocs.leeds.ac.uk/welcome.html is a good place to start

if(HPCFLG==1): # This checks if the code is being run on the HPC or not and this is the submission script for the HPC 
    if(inputs.run['cores']!=1): # This checks if the code is being run on more than 1 core
        os.environ["OMP_NUM_THREADS"]=str(inputs.run['cores']) # This sets the number of threads to the number of cores
    number=random.randint(99999,1000000) # This generates a random number between 99999 and 1000000
    file1="test"+str(number)+".sh" # This creates a file name for the submission script
    f=open(file1,"w") # This opens the submission script
    f.write("#$ -cwd -V \n") # This sets the current working directory to the directory the script is run from and exports all environment variables
    if(inputs.run['cores']!=1): # This checks if the code is being run on more than 1 core
        f.write("#$ -pe smp "+str(inputs.run['cores'])+" \n") # This sets the number of cores to the number of cores
    f.write("#$ -l h_rt="+inputs.run['runtime']+"\n") # This sets the runtime to the runtime specified in inputs.py
    f.write("#$ -l h_vmem=5G \n") # This sets the memory to 5GB
    f.write("module add mkl \n") # This loads the mkl module 
    # f.write('time ./d_check.exe')
    f.write('time ./test.exe') # This runs the executable
    f.close() # This closes the submission script
    
    subprocess.call(['qsub',file1])     # This submits the job to the queue
else:
    if(inputs.run['cores']!=1): # This checks if the code is being run on more than 1 core
        os.environ["OMP_NUM_THREADS"]=str(inputs.run['cores']) # This sets the number of threads to the number of cores
        # os.environ["ACC_CACHE_READ_MOSTLY"] = "true"
        # os.environ["ACC_CACHE_SHARED"] = "true"
    subprocess.run(["./test.exe"]) # This runs the executable