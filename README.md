# git-automation
This is a basic automation tool for git. You can do some basic thing of github without knowing git

Git Automation has now only one tool, Hope I will manage time to make it resourceful

It currently has:-
1. ssh generator for Termux

Features:-
- ssh key generation
- support 3 types of key pair
  - ed255
  - rsa
  - legacy
- ask user for email and username in the runtime
- Automatically copy .pub code (if termux api app installed)
- Does not collect user data

Supported OS:
- Termux only, others not tested

Dependency:-
- Termux Api App [[Download->]](https://) (f-droid)

### How to install:
```sh
wget https:// && chmod +x git-ssh.sh && ./git-ssh.sh
```

### You can delete this installer after generating
```sh
rm git-ssh.sh
```

### To delete generated ssh key-pair
```sh
rm -rf ~/.ssh
```
