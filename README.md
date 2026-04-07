# My Arch Linux Setup

Programs to install and their configuration files.

# Instructions

## Programs

Programs to installed are found in package-lists inside the pkg-lists folder.
To install all packages from a package list, run:
Install packages from the 

'''bash
yay -S $(path/to/package-list)
'''

### Configuration Files

To copy the configuration files into their target directories, run:
'''bash
./run_env
'''

This overwrites existing files in the target directories!
Run the above command with the --dry flag first to see the commands that will be run.

Some manual tasks need to be performed for some of the configurations:

keyd requires its configuration file to live in /etc/keyd/
Easiest way to achieve this is to create a symlink, e.g.:
'''bash
sudo ln -s /home/jonas/.config/keyd/default.conf /etc/keyd/default.conf
'''

The hyprland config includes desktop/laptop specific configurations.
They are seperated out into their own files in .config/hypr/.
Source the file including the extensions you want to activate in the main hyprland.conf file.

The google drive integration via rclone is configured in this repository via systemd service 
that needs to be enabled:
'''bash
systemd --user enable rclone-gdrive.service
'''
