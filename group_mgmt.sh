#!/bin/bash
create_group() {
    read -p "Enter the group name: " groupname
    if getent group "$groupname" > /dev/null 2>&1; then
        echo "Group '$groupname' already exists."
    else
        sudo groupadd "$groupname"
        echo "Group '$groupname' created successfully."
    fi
}

delete_group() {
    read -p "Enter the group name to delete: " groupname
    if getent group "$groupname" > /dev/null 2>&1; then
        sudo groupdel "$groupname"
        echo "Group '$groupname' deleted successfully."
    else
        echo "Group '$groupname' does not exist."
    fi
}

add_user_to_group() {
    read -p "Enter the username: " username
    read -p "Enter the group name in which you want to add the user: " groupname
    if getent passwd "$username" > /dev/null 2>&1; then
        if getent group "$groupname" > /dev/null 2>&1; then
            sudo usermod -aG "$groupname" "$username"
            echo "User '$username' added to group '$groupname' successfully."
        else
            echo "Group '$groupname' does not exist."
        fi
    else
        echo "User '$username' does not exist."
    fi
}

# Main script
echo "Group management script"
echo "1. Create group"
echo "2. Delete group"
echo "3. Add user to group"
read -p "Enter your choice: " choice

case $choice in
    1) create_group ;;
    2) delete_group ;;
    3) add_user_to_group ;;
    *) echo "Invalid choice" ;;
esac

