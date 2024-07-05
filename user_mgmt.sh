#!/bin/bash
add_user() {
    read -p "Enter Username: " username
    if getent passwd "$username" > /dev/null 2>&1; then
        echo "User '$username' already exists."
    else
        stty -echo
        read -p "Enter password: " password
        stty echo
        echo
        sudo useradd -m -p $(openssl passwd -1 "$password") "$username"
        echo "User '$username' created successfully."
    fi
}

delete_user() {
    read -p "Enter username to delete: " username
    if getent passwd "$username" > /dev/null 2>&1; then
        sudo userdel -r "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User '$username' does not exist."
    fi
}

modify_user() {
    read -p "Enter the username to modify: " username
    if getent passwd "$username" > /dev/null 2>&1; then
        # Additional modification options here
        sudo usermod "$username"
        echo "User '$username' modified successfully."
    else
        echo "User '$username' does not exist."
    fi
}

# Main script
echo "User management script"
echo "1. Add user"
echo "2. Delete user"
echo "3. Modify user"
read -p "Enter your choice: " choice

case $choice in
    1) add_user ;;
    2) delete_user ;;
    3) modify_user ;;
    *) echo "Invalid choice" ;;
esac

