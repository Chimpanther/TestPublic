#!/bin/bash

function install_wasp() {
    """
    This function installs Cloudflare Wasp and enrolls in team aune.cloudflareaccess.com on Ubuntu 20.04.
    """
    try {
        # Check if the OS is Ubuntu 20.04
        if [[ $(lsb_release -rs) != "20.04" ]]; then
            echo "This script is only compatible with Ubuntu 20.04"
            exit 1
        fi
        
        # Install Cloudflare Wasp
        curl -s https://pkg.cloudflare.com/pub/wasp/install.sh | sudo bash
        
        # Enroll in team aune.cloudflareaccess.com
        sudo wasp enroll --team aune.cloudflareaccess.com
        
        echo "Cloudflare Wasp installed and enrolled in team aune.cloudflareaccess.com"
    } catch {
        # Log the error
        echo "Error: $1"
        exit 1
    }
}

# Call the function
install_wasp
