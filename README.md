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

The google drive integration works via rclone. To get it working run the config wizard and follow
the steps for creating a new google drive config:
'''
rclone config
'''

Name the drive jonas-gdrive or you need to edit the rclone-gdrive.service used for automatic mounting (described in more
detail below).

The config will ask for a client id/secret which is stored in 1password.
Alternativly, create a new one by following this tutorial:
https://rclone.org/drive/#making-your-own-client-id

To have the google drive automatically mount on login activate the systemd service
which is part of the config:
'''bash
systemd --user enable rclone-gdrive.service
'''

This only works out of the box if your home directory is /home/jonas and your rclone gdrive is named jonas-gdrive.
Otherwise change ~/.config/systemd/user/rclone-gdrive.service accordingly.

To use the ssh-agent service (start ssh-agent on login to only enter ssh credentials once), enable it:
'''bash
systemd --user enable ssh-agent.service
'''
