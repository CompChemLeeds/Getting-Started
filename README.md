# Getting-Started

This is a short introduction to how we want to use, store and share work in the group. The is document will mainly focus on setting up repositories on Github and your local workstation. There is also a seperate folder containing an introduction to Fortran95 (or newer ?!), Make files and python runscripts. Most of the information is general but some of it is specific to the group or using the [HPC](https://arcdocs.leeds.ac.uk/welcome.html) in Leeds. Before proceeding you need to make a personal GitHub account [HERE](https://github.com/join)

## Chapter 1: What is git and GitHub 

## Chapter 2: Set-up

You will first need to check if you have git installed on your local system. This can be done by opening a terminal and running the command 

    git version
and the output will indicate if git is installed. If git is not available then you will need to install it. If using a MacOS you should run the command 

    xcode-select --install 
Click 'install' on the pop up to begin the process. This will install Xcode Command Line Tools which will allow you actually use your terminal. 

In order to utilise the full capacities of git and to access the repositories, you’ll need to install git from the command line and create a github account.
In order to install git on a mac, it’s best to install homebrew which is useful for installing many applications for macs. This can be done by entering the following command in the terminal:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Hombrew then can be used to install git by entering: brew install git
The next time is to configure git from the command line with the github account. This is done once again through the command line:
git config --global user.name 'Cm18rb'
git config --global user.email 'cm18rb@leeds.ac.uk'
git config --global --list
git config --global --add --bool push.autoSetupRemote true
It’s very important that the username and email given here are the exact same as the username and password you’ve set for github.
The next step is to set up a ssh key to grant github access and bypass having to give credentials every time. We start by generating an SSH key.