#!/bin/bash

# Clear the screen
clear

# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi
# Define color codes
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color
printf "\n%.0s" {1..2}
echo -e "${BLUE}███████████████╗██████╗██████╗██╗  ██╗${NC}"
echo -e "${BLUE}██╔════╚══██╔══██╔═══████╔══████║ ██╔╝${NC}"
echo -e "${BLUE}███████╗  ██║  ██║   ████████╔█████╔╝ ${NC}"
echo -e "${BLUE}╚════██║  ██║  ██║   ████╔══████╔═██╗ ${NC}"
echo -e "${BLUE}███████║  ██║  ╚██████╔██║  ████║  ██╗${NC}"
echo -e "${BLUE}███╗═══██╗██████╗██╗══╝████╗╚═╚████████████╗   ██╗${NC}"
echo -e "${BLUE}████╗  ████╔════╝██║   ██╚██╗ ██╔██╔════████╗  ██║${NC}"
echo -e "${BLUE}██╔██╗ ████║  █████║   ██║╚████╔╝█████╗ ██╔██╗ ██║${NC}"
echo -e "${BLUE}██║╚██╗████║   ████║   ██║ ╚██╔╝ ██╔══╝ ██║╚██╗██║${NC}"
echo -e "${BLUE}██║ ╚████╚██████╔╚██████╔╝  ██║  █████████║ ╚████║${NC}"
echo -e "${BLUE}╚═╝  ╚═══╝╚═════╝ ╚═════╝   ╚═╝  ╚══════╚═╝  ╚═══╝${NC}"
printf "\n%.0s" {1..2}

# List of files to create symlinks for
files=(".vimrc" ".nvidia-setting-rc" ".bashrc" ".bash_logout" ".bash_profile")
source_dir="$HOME/hyprland-dotfiles"
destination_dir="$HOME"

for file in "${files[@]}"; do
    source_file="$source_dir/$file"
    destination_file="$destination_dir/$file"
    # Check if the source file exists
    if [ ! -e "$source_file" ]; then
        echo -e "${YELLOW}[WARNING]${NC} File ${CYAN}$file${NC} does not exist in directory ${CYAN}$source_dir${NC}. Skipping..."
        continue
    fi
    # Check if the destination file already exist
    if [ -e "$destination_file" ]; then
        # Check correct symlink
        if [ -L "$destination_file" ] && [ "$(readlink "$destination_file")" == "$source_file" ]; then
            echo -e "${BLUE}[INFO]${NC} ${CYAN}$file${NC} is already linked in ${CYAN}$destination_dir${NC}."
            continue
        fi

        echo -e "${YELLOW}[WARNING]${NC} File ${CYAN}$file${NC} already exists in directory ${CYAN}$destination_dir${NC}."

        # Validate user input
        while true; do
            read -p "Do you want to replace $file? [y/n]: " response
            if [ "$response" == "y" ]; then
                rm -f "$destination_file"
                ln -s "$source_file" "$destination_file"
                echo -e "${BLUE}[INFO]${NC} ${CYAN}$file${NC} has been successfully linked in ${CYAN}$destination_dir${NC}."
                break
            elif [ "$response" == "n" ]; then
                echo -e "${BLUE}[INFO]${NC} Skipping ${CYAN}$file${NC}."
                break
            else
                echo -e "${YELLOW}[WARNING]${NC} Invalid input. Please enter 'y' or 'n'."
            fi
        done
    else
        ln -s "$source_file" "$destination_file"
        echo -e "${BLUE}[INFO]${NC} ${CYAN}$file${NC} has been successfully linked in ${CYAN}$destination_dir${NC}."
    fi
done
echo
echo -e "${GREEN}[DONE]${NC} Script complete!"
