# Main script
echo "Main Script"
echo "1. User management"
echo "2. Group management"
echo "3. Backup"
read -p " Enter your choice:" choice

case $choice in
    1) ./user_mgmt.sh;;
    2) ./group_mgmt.sh;;
    3) ./backup.sh;;
    *) echo "Invalid choice";;
esac

