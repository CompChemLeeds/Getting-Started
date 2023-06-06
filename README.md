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

![SSH keys](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/16653370-3f06-49a8-881c-2ff44612b6c6)

Here you can simply paste the key copied into the box and give the key an appropriate name.

![ssh form](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/46780bd9-b7ab-4be1-a84b-4b3bc518e388)

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

```
git add Readthis.txt
```

Git is now tracking the progress of the readthis file but will ignore/disregard changes to the dontreadthis file. In order to upload this then onto github the commit command is used to stage the files for uploading with a message to help organisation, before git push is used to complete the upload.

![terminal commit ](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/591929ac-108f-431a-943a-7ca86f160005)


Returning to github, the first commit has been pushed to the repository online.

![Repository with commit](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/44739fc0-a573-406b-a29a-410b2d109f6a)


The repository currently has only the files we wanted, the time at which each file was changed (the time of commit that changed each file) and the commit history where it is possible to view/restore old versions.
If the repository currently exists online and you wish to create a remote repository, this can be done through the git clone command. The url to accompany this command can be found on the github page of the repository.
PICTURE

Once the clone has been made the files can be edited and then commited to github once changes have been made. (It’s a good idea to do this very frequently, even when the changes are small). If a local repository is out of date, you can use ‘git pull’ to update the repository to the current version present on github.

### Branches

There will be times where it is important to work on a codebase without affecting the original copy. For this, git has the ability to create branches of a repository, where you can edit and develop multiple ideas without having to maintain functionality across everything.

![Branches](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/1799710d-8498-4eb4-82a2-de7d80fce5a5)


In the terminal you can use git checkout to create and swap between branches. The -b flag is needed to create a new branch and a handy flag is simply ‘-‘ which returns to the last branch used.

```
git checkout -b Test
git checkout main
git checkout -
```

Separate branches require their own commits and pulls but are useful to test new ideas and maybe several at the same time. When the branch has completed its purpose and you want to apply the changes to the main branch, merge requests can be created within Github. Pull requests can be created via the pull request tab and clicking the green button for new request.

![Pull request](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/f15a5722-c6b5-45e2-ae74-fbcbfe17e258)

The next step is to pick the two branches to be merged and ensure the differences noted are expected before submitted, where a label and a description needs to be given. It’s normal for a merge request to be approved by an admin of the repository before being carried through.

![Comparing changes](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/6d1092bc-eec9-433d-b6e4-56c3b40c7d53)

![Pull request2](https://github.com/CompChemLeeds/Getting-Started/assets/92863384/af1410fd-71cf-44d7-8c10-0aabca3a3207)

It is best practise to have a main branch and then use another branch to complete work on. This also applies to collaborative work where each person should have a seperate branch to work on to ensure there aren't conflicts.

## Chapter 4: Organisations

GitHub Organisations provide a centralized and structured space for teams or research groups to collaborate on projects. It allows members to contribute to repositories, manage access privileges, and facilitate communication within the group. By creating an organization on GitHub, you establish a collective identity that represents your research group and serves as a hub for all your collaborative efforts.

Through the use of Organisations, Members can work simultaneously on the same project, contribute code, propose changes, and review each other's work. can easily track changes made to projects, revert to previous versions, and branch out to experiment with new ideas without affecting the main codebase. This ensures that the group can maintain a reliable and organized history of their work. Inside the Organisation, members can be assigned different roles, such as administrators, collaborators, or viewers, depending on their level of involvement in the project. This ensures that sensitive information remains secure and that each member has appropriate permissions to contribute effectively. 

### How to work in this group

For project work within the group it is best practise to create a repository within the organisation that you then have access to through your personal account. This makes collaboration and branching much easier and adds a layer of protection incase something goes wrong! So if starting a new project a new organisation repository will be made with appropriate branches if joining an exisiting project you will be added to the project and given a new branch to work on. Once you've completed a bit of work on your branch you can then push it to the main branch other people working on their own work can then pull your changes to their branch or choose not to at all.
