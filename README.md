# git-automation
This is a basic automation tool for git. You can do some basic thing of github without knowing git

Git Automation has now only one tool, Hope I will manage time to make it resourceful

It currently has:-
1. ssh generator for Termux

Features:-
- ssh key generation
- support 4 types of key pair
  - ed25519
  - rsa 4096
  - ed25519-sk
  - ecdsa-sk
- ask user for email and username in the runtime
- Automatically copy .pub code (if termux api app installed)
- Does not collect user data

Supported OS:
- Termux only, others not tested

Dependency:-
- Termux Api App [[Download->]](https://f-droid.org/en/packages/com.termux.api/) (f-droid)

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
