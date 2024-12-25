#!/bin/bash

# Clear the screen
clear

# Define color codes
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Print spaces and ASCII art
echo
echo
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
echo
echo

# List of files to create symlinks for
files=(".vimrc" ".nvidia-setting-rc")
source_dir="./hyprland-dotfiles"
destination_dir="$HOME"

for file in "${files[@]}"; do
    source_file="$source_dir/$file"
    destination_file="$destination_dir/$file"

    if [ -e "$destination_file" ]; then
        echo -e "${YELLOW}[WARNING]${NC} File ${CYAN}$file${NC} already exists in directory ${CYAN}$destination_dir${NC}."
        
        # Validate user input
        while true; do
            read -p "Do you want to replace $file? (y/n): " response
            if [[ "$response" == "yes" || "$response" == "y" ]]; then
                rm -f "$destination_file"
                ln -s "$source_file" "$destination_file"
                echo -e "${BLUE}[INFO]${NC} ${CYAN}$file${NC} has been successfully linked in ${CYAN}$destination_dir${NC}."
                break
            elif [[ "$response" == "no" || "$response" == "n" ]]; then
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

echo -e "${GREEN}[DONE]${NC} Script complete!"

