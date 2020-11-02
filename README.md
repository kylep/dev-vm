A simple, reusable, distributable development VM.

# This project is discontinued

I don't use this any more. 
There's nothing really wrong with it, I just find it easier to work directly from my macbook and its more consistent with what my team is doing. 

This project will be left online for reference purposes. Maybe I'll revive it someday.


# Usage

This environment should work on Mac, Windows, and Linux, but I've only tried it
on Mac.

1. [Install virtualbox](https://www.virtualbox.org/wiki/Downloads)
1. [Install Vagrant](https://www.vagrantup.com/downloads.html)
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
1. Git clone this repository
1. Change directory to this checkout
1. Run `vagrant up`
1. Wait for the provisioning to finish
1. SSH in and use the VM for development.
   From the git project directory, run `vagrant ssh`.
1. Now inside the VM, run `tmux` to launch the window manager.


You can transfer files to and from the VM easily by using the /vagrant mount.


---


# Why use a development VM?

## VM vs. Directly developing on your laptop ("on metal")

It's convenient to just open your IDE of choice right on your laptop and get to
it. When you only have one project you'll ever work on, this is actually a
great way to work. Realistically though, most people will work on several
projects from the same workstation.

Before long, your workstation starts to look like [this XKCD comic](https://xkcd.com/1987/).

Python virtual environments can help, but there's nothing quite like a clean
dev environment.

On top of that, there's the state of your environment to worry about. Maybe you
have personal projects on AWS/GCP/OpenStack/Kubernetes, and your local terminal
is already scoped to those sessions. By using a VM you don't have any of those
scoping problems.


## VM vs. a Docker container

A docker container fixes all the same problems a VM does.

There are a lot of good arguments for using a Docker container instead of a
virtual machine. I think in a lot of cases, it's actually a better way to go.

Containers start faster, can be instantiated once per project, and are easier
to distribute. Eventually I might switch over to using a container too.

In my case, I still prefer a VM for the following reasons:

1. Docker and minikube can run inside the VM, keeping them separate from the
   workstation's containers and images. This is my main reason. This allows
   writing and testing of Python code that operates Docker containers, such as
   the [Breqwatr deployment tool](https://github.com/breqwatr/breqwatr-deployment-tool).
1. TMUX works better in a VM. I could probably make it work right in Docker,
   but haven't troubleshot it. Mostly the pager length gets screwy often.
1. Mac OS Catalina was causing trouble with volume mounts, where the
   container freezes when it starts. Suspect a newer version of Docker would
   fix this problem, but haven't checked.


---


# What's in the VM?

- **Window manager**: TMUX, with custom configuration and plugins:
    - [TPM: Tmux plugin manager](https://github.com/tmux-plugins/tpm)
    - [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible):
      A set of tmux options that should be acceptable to everyone.
    - [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect):
      Manually saves and restores tmux environments.
    - [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum):
      Automatically saves and restores tmux state.
- **Text editor**: VIM 8 with custom config and plugins:
    - [junegunn/vim-plug](https://github.com/junegunn/vim-plug):
      Vim plugin manager
    - [ALE](https://github.com/dense-analysis/ale):
      asynchronous linter using pylint and flake8. Highlights problems with
      your Python code.
    - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive):
      Git wrapper to make merge conflicts easier to resolve
    - **Spell-check:** Dictionary additions for common technical terms.
      Reminder: use `:set spell` and `:set nospell` to use this.
- **Version Control**: Git
- **Docker**
- **Cloud Tools**
    - [Google Cloud SDK](https://cloud.google.com/sdk/docs/)
- **Pip3-managed CLI Tools**:
    - [httpie](https://pypi.org/project/httpie/):
      An HTTP CLI, useful for working with APIs
    - [Ansible](https://pypi.org/project/ansible/) IT automation system
    - ~~[jq](https://pypi.org/project/jq/)~~:
      Broken & disabled for now, it won't install any more...
    - [JSC2F](https://pypi.org/project/jsc2f/):
      A little CLI for interacting with JSON in sql cells
    - [Breqwatr Deployment Tool](https://pypi.org/project/breqwatr-deployment-tool/)
      Breqwatr's open-source private cloud deployment tool
    - [OSC](https://pypi.org/project/python-openstackclient/):
      command-line client for OpenStack
- **NodeJS & NPM**: Mostly for NPM
