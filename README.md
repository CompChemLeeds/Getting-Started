# Getting-Started

This is a short introduction to how we want to use, store and share work in the group. The is document will mainly focus on setting up repositories on Github and your local workstation. There is also a seperate folder containing an introduction to Fortran95 (or newer ?!), Make files and python runscripts. Most of the information is general but some of it is specific to the group or using the [HPC](https://arcdocs.leeds.ac.uk/welcome.html) in Leeds. Before proceeding you need to make a personal GitHub account [HERE](https://github.com/join)

## Chapter 1: What is git and GitHub 

Git is a very useful 'Version control system' that allows for the storage and organistion of changes made to files, and is capable of tracking all changes made to a directory/repository. Git also allows for easy collaboration, with each person capable of working on a local version of the repository before merging when ready to submit changes. Git also has a system to resolve conflicts from multiple users as well as rollback erroneous changes.

Github is a web platform running on git that gives easier access, visualisation and management of git repositories. With a github account, git repositories can be hosted and shared and updated with attached descriptions and visible commit logs. Github also has the organisation feature which allows a group to collaborate across multiple projects. 

## Chapter 2: Set-up

### Instalation 

You will first need to check if you have git installed on your local system. This can be done by opening a terminal and running the command 

    $ git version
and the output will indicate if git is installed. If git is not available then you will need to install it. If using a MacOS you should run the command 

    xcode-select --install 
Click 'install' on the pop up to begin the process. This will install Xcode Command Line Tools which will allow you actually use your terminal for development. You will also need to install [Homebrew](https://brew.sh) which is a package manager and will make it easy to install, update and remove packages e.g. libraries or compilers. To install Homebrew run following command in the terminal

    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

If you decided not to install Command Line Tools you could install git using Hombrew using the command 
    
    $ brew install git

### Configuration 

We can now configure git but before you proceed make please make sure you have made your [GitHub account](https://github.com/join). Once again in the terminal

    $ git config --global user.name 'UserName'
Use your GitHub username this means all your commits will appear under this name

    $ git config --global user.email 'your_email@example.com'
Use the email you signed up to GitHub with

    $ git config --global --add --bool push.autoSetupRemote true
This command is an optional part of the setup that makes creating a github repository from the command line easier. It's reccomend to instead follow the procedure laid out later in the guide.

#### SSH Key Generation
It’s very important that the username and email given here are the exact same as the username and password you’ve set for github. Next we need to set up a ssh key to grant GitHub access to your files and bypass having to give credentials every time. Open a new terminal and make sure you are in your home directory this is usally the defualt directory to open in if not enter the command 

    $ cd 
    
which should take you to your home directrory. nNow run the command 

    $ ls -a 
    
which will show all directories including hidden ones. If the directory .ssh does not exist run the command 

    $ mkdir ~/.ssh    

We start by generating an SSH key copy the following command using your GitHub email address

    $ ssh-keygen -t ed25519 -C "your_email@example.com"

This will create a new SSH key with your email used as the label

    >  Generating public/private ALGORITHM key pair.

Press **Enter** to accept the default location to save the key. When prompted enter a secure passphrase. Now we can add the SSH key to the ssh-agent. Run the command 

    $ eval "$(ssh-agent -s)"

Next  run 

    $ open ~/.ssh/config

##### MacOS 

If you get the output 

    > The file /Users/YOU/.ssh/config does not exist.

run 

    $ touch ~/.ssh/config

and then try the open command again. You will then need to add to the config file

    Host github.com
     AddKeysToAgent yes
     UseKeychain yes
     IdentityFile ~/.ssh/id_ed25519 

You can then optionally add your SSH key to your apple keychain to store the passphrase

    $ ssh-add --apple-use-keychain ~/.ssh/id_ed25519

#### Putting your SSH key on github 

##### MacOS 

Run the command 

    $ pbcopy < ~/.ssh/id_ed25519.pub    

##### LINUX

Run the command  

    $ cat ~/.ssh/id_ed25519.pub


On the settings page of your github account there is a tab for ‘SSH and GPG’ keys where you can find a green button for creating a new SSH key.

PICTURE 

Here you can simply paste the key copied into the box and give the key an appropriate name.

PICTURE 

You can got through this process on both your local machine and ARC meaning you can access your GitHub repositories on both systems.

## Chapter 3: Using Git and GitHub

### Creating a Repository 

The main ways to create a github repository is to enter is through the github website. On your profile page, there will be a tab for repositories, and entering that area shows a large green button ‘New’ that allows you to create a repository.
Pressing this button gives a form to fill in on the basic details of your repository, including the name, a brief description, whether it should be visible to others and whether a readme file should be generated.

PICTURE

### Commits, Push and Pull

If the code already exists (at least in parts), it’s best to enter the directory for the code and make it a remote origin for the repository.

```
git init 
git remote add origin https://github.com/username/repository.git
```
If you have the ssh key installed, replace the url with the following: git@github.com:username/repo.git or use this in the command line
git remote set-url origin git@github.com:username/repo.git
Inside the directory there are 2 files, one to be uploaded and one to be ignored. This can be managed with the git add command.

PICTURE

Git is now tracking the progress of the readthis file but will ignore/disregard changes to the dontreadthis file. In order to upload this then onto github the commit command is used to stage the files for uploading with a message to help organisation, before git push is used to complete the upload.

PICTURE

Returning to github, the first commit has been pushed to the repository online.

PICTURE

The repository currently has only the files we wanted, the time at which each file was changed (the time of commit that changed each file) and the commit history where it is possible to view/restore old versions.
If the repository currently exists online and you wish to create a remote repository, this can be done through the git clone command. The url to accompany this command can be found on the github page of the repository.
PICTURE

Once the clone has been made the files can be edited and then commited to github once changes have been made. (It’s a good idea to do this very frequently, even when the changes are small). If a local repository is out of date, you can use ‘git pull’ to update the repository to the current version present on github.

### Branches

There will be times where it is important to work on a codebase without affecting the original copy. For this, git has the ability to create branches of a repository, where you can edit and develop multiple ideas without having to maintain functionality across everything.

PICTURE

In the terminal you can use git checkout to create and swap between branches. The -b flag is needed to create a new branch and a handy flag is simply ‘-‘ which returns to the last branch used.

PICTURE

Separate branches require their own commits and pulls but are useful to test new ideas and maybe several at the same time. When the branch has completed its purpose and you want to apply the changes to the main branch, merge requests can be created within Github. Pull requests can be created via the pull request tab and clicking the green button for new request.

PICTURE

The next step is to pick the two branches to be merged and ensure the differences noted are expected before submitted, where a label and a description needs to be given. It’s normal for a merge request to be approved by an admin of the repository before being carried through.

PICTURE


