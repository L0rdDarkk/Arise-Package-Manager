#!/bin/bash

# Arise Package Manager for Ubuntu
# Created by: Juled aka L0rdDarkk

# Color codes for output
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'  # No color

# Function for the progress bar
progress_bar() {
    local duration=$1
    local bar_length=20
    local sleep_duration=$(echo "scale=3; $duration / $bar_length" | bc)

    echo -n "Progress: ["
    for i in {1..$bar_length}; do
        echo -n "#"
        sleep $sleep_duration
    done
    echo "] Done!"
}

install_package() {
    package_name=$1
    echo -e "${CYAN}Preparing to install${NC} ${MAGENTA}$package_name${NC} using ${BLUE}apt-get${NC}..."
    

    progress_bar 5
    
    # Using apt-get for installation
    sudo apt-get install -y "$package_name" 2>&1
    
    echo -e "${GREEN}$package_name${NC} ${BLUE}installed successfully!${NC}"
}

update_packages() {
    echo -e "${CYAN}Updating packages using ${BLUE}apt-get${NC}..."
    
    # Update proccess simulated
    progress_bar 3
    
    # Using apt-get for updating packages
    sudo apt-get update
    
    echo -e "${GREEN}Packages updated successfully!${NC}"
}

remove_package() {
    package_name=$1
    echo -e "${CYAN}Preparing to remove${NC} ${MAGENTA}$package_name${NC} using ${BLUE}apt-get${NC}..."
    

    progress_bar 4
    
    # Using apt-get for package removal
    sudo apt-get remove -y "$package_name"
    
    echo -e "${GREEN}$package_name${NC} ${BLUE}removed successfully!${NC}"
}

list_packages() {
    echo -e "${CYAN}Listing installed packages using ${BLUE}apt${NC}..."
    
    # Use apt to list installed packages
    sudo apt list --installed
}

search_packages() {
    search_term=$1
    echo -e "${CYAN}Searching for packages matching${NC} ${MAGENTA}$search_term${NC} using ${BLUE}apt${NC}..."
    
    # Using apt to search for packages
    sudo apt search "$search_term"
}

upgrade_packages() {
    echo -e "${CYAN}Upgrading all installed packages using ${BLUE}apt-get${NC}..."
    
    # Simulate upgrade process
    progress_bar 4
    
    # Using apt-get for upgrading packages
    sudo apt-get upgrade -y
    
    echo -e "${GREEN}Packages upgraded successfully!${NC}"
}

autoremove_packages() {
    echo -e "${CYAN}Removing unused packages using ${BLUE}apt-get${NC}..."
    
    # Simulate autoremove process
    progress_bar 3
    
    # Using apt-get for autoremove
    sudo apt-get autoremove -y
    
    echo -e "${GREEN}Unused packages removed successfully!${NC}"
}

system_info() {
    echo -e "${CYAN}Displaying system information...${NC}"
    
    # Display system information
    uname -a
    lsb_release -a
}

interactive_mode() {
    echo -e "${CYAN}Entering interactive mode...${NC}"
    
    PS3="Select an option: "
    options=("Install Package" "Update Packages" "Remove Package" "List Packages" "Search Packages" "Upgrade Packages" "Autoremove Packages" "Show System Info" "Exit")
    
    select opt in "${options[@]}"; do
        case $opt in
            "Install Package")
                read -p "Enter the package name to install: " package_name
                install_package "$package_name"
                ;;
            "Update Packages")
                update_packages
                ;;
            "Remove Package")
                read -p "Enter the package name to remove: " package_name
                remove_package "$package_name"
                ;;
            "List Packages")
                list_packages
                ;;
            "Search Packages")
                read -p "Enter the search term: " search_term
                search_packages "$search_term"
                ;;
            "Upgrade Packages")
                upgrade_packages
                ;;
            "Autoremove Packages")
                autoremove_packages
                ;;
            "Show System Info")
                system_info
                ;;
            "Exit")
                echo -e "${CYAN}Exiting interactive mode.${NC}"
                break
                ;;
            *)
                echo -e "${RED}Invalid option.${NC}"
                ;;
        esac
    done
}

package_version() {
    package_name=$1
    echo -e "${CYAN}Displaying version information for${NC} ${MAGENTA}$package_name${NC} using ${BLUE}apt-show-versions${NC}..."
    
    # Using apt-show-versions for package version information
    apt-show-versions "$package_name"
}

main() {
    if [ $# -eq 1 ]; then
        case "$1" in
            "man")
                show_man_page
                ;;
            "list")
                list_packages
                ;;
            "update")
                update_packages
                ;;
            "upgrade")
                upgrade_packages
                ;;
            "autoremove")
                autoremove_packages
                ;;
            "info")
                system_info
                ;;
            "interactive")
                interactive_mode
                ;;
            *)
                echo -e "${RED}Invalid command: $1${NC}"
                echo -e "${RED}Usage: arise [install|update|remove|list|search|upgrade|autoremove|info|interactive|man] [package_name]${NC}"
                exit 1
                ;;
        esac
    elif [ $# -eq 2 ]; then
        case "$1" in
            "install")
                install_package "$2"
                ;;
            "remove")
                remove_package "$2"
                ;;
            "search")
                search_packages "$2"
                ;;
            "version")
                package_version "$2"
                ;;
            *)
                echo -e "${RED}Invalid command: $1${NC}"
                echo -e "${RED}Usage: arise [install|update|remove|list|search|version] [package_name]${NC}"
                exit 1
                ;;
        esac
    else
        echo -e "${RED}Usage: arise [install|update|remove|list|search|upgrade|autoremove|info|interactive|man] [package_name]${NC}"
        exit 1
    fi
}

# The main function
main "$@"

