Personal Settings for ypsitau
=============================

Basic Setting (for Mac and Linux)
---------------------------------

Personal configuration files for ypsitau are stored in GitHub repository.
To set up them, do the following commands.

    $ cd ~
    $ git clone https://github.com/ypsitau/dotfiles.git
	$ dotfiles/setup.sh


Linux Settings
--------------

### Ubuntu on VirtualBox

At first, you need to do the following preparation:

    $ sudo apt-get install build-essential module-assistant
    $ sudo m-a prepare

Then, mount the image of Guest Additions by doing
`[Device]-[Insert Guest Additions CD image]` in VirtualBox's main menu bar.
Afterward, execute the VirtualBox Guest Additions setup script:

    # /media/username/VBOXADDITIONS_x.x.xx_xxxxx/VBoxLinuxAdditions.sh

Following list shows other necessary preparations:

* Add user name to `vboxsf` group by editing `/etc/group`.


### Fedora on VirtualBox


At first, you need to do the following preparation:

    $ su
    # yum install gcc

Then, execute the VirtualBox Guest Additions setup script:

    # /media/username/VBOXADDITIONS_x.x.xx_xxxxx/VBoxLinuxAdditions.sh

Because of the lack of required header files, this would cause an error.
Read the error message and install required package.

After that, execute the setup script again:

    # /media/username/VBOXADDITIONS_x.x.xx_xxxxx/VBoxLinuxAdditions.sh

Following list shows other necessary preparations:

* Add user name to `vboxsf` and `wheel` group by editing `/etc/group`.


### VNC Server (for Ubuntu)

Do the following commands.

    $ sudo apt-get install vnc4server

Create /etc/vnc.conf.

    $geometry = "1366x768";
    $depth = "24";

Ubuntu on Amazon EC2 does not include GNOME environment. Install it as follows.

    $ sudo apt-get install gnome

Edit ~/.vnc/xstartup.

    #!/bin/sh
    
    # Uncomment the following two lines for normal desktop:
    # unset SESSION_MANAGER
    # exec /etc/X11/xinit/xinitrc
    
    [ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
    [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
    xsetroot -solid grey
    #vncconfig -iconic &
    x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
    #x-window-manager &
    exec gnome-session &

Start vncserver.

    $ vncserver :1
