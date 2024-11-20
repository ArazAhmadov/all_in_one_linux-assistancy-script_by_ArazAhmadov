#!/bin/bash

# Functions for System Operations
function enumerate_hostname {
    echo -e "\n--- 1. Enumerate Hostname ---"
    hostname
}

function modify_hostname {
    echo -e "\n--- 2. Modify (Set A New Hostname) ---"
    read -p "Enter new hostname: " new_hostname
    sudo hostnamectl set-hostname "$new_hostname" && echo "Hostname changed to '$new_hostname'."
}

function extract_kernel_properties {
    echo -e "\n--- 3. Extract Kernel Properties ---"
    uname -a
}

function catalog_cpu_specs {
    echo -e "\n--- 4. Catalog CPU Specifications ---"
    lscpu | grep -E 'Model name|CPU\(s\)|Thread|Architecture|MHz'
}

function quantify_memory {
    echo -e "\n--- 5. Quantify Physical Memory ---"
    free -h
}

function assess_storage {
    echo -e "\n--- 6. Assess Storage Subsystems ---"
    df -h --output=source,fstype,size,used,avail,pcent,target
}

function profile_network_interfaces {
    echo -e "\n--- 7. Profile Network Interfaces ---"
    ip addr show
}

function compile_update_history {
    echo -e "\n--- 8. Compile System Update History ---"
    # For RPM-based systems
    sudo rpm -qa --last
}

function identify_active_services {
    echo -e "\n--- 9. Identify Active Services ---"
    systemctl list-units --type=service --state=running
}

function enumerate_packages {
    echo -e "\n--- 10. Enumerate Installed Packages ---"
    rpm -qa
}

function measure_uptime {
    echo -e "\n--- 11. Measure System Uptime ---"
    uptime
}

function analyze_mount_points {
    echo -e "\n--- 12. Analyze File System Mount Points ---"
    mount | column -t
}

function evaluate_network_throughput {
    echo -e "\n--- 13. Evaluate Network Throughput ---"
    echo "Network interface statistics:"
    cat /proc/net/dev
}

function inspect_firewall_rules {
    echo -e "\n--- 14. Inspect Firewall Rules ---"
    sudo firewall-cmd --list-all || echo "Firewall rules not available."
}

function summarize_environment {
    echo -e "\n--- 15. Summarize Environment Variables ---"
    printenv
}

function catalog_usb_devices {
    echo -e "\n--- 16. Catalog Connected USB Devices ---"
    lsusb
}

function list_active_processes {
    echo -e "\n--- 17. List Active Processes ---"
    ps aux --sort=-%cpu | head -n 10
}

function analyze_temperature {
    echo -e "\n--- 18. Analyze Hardware Temperature ---"
    sensors 2>/dev/null || echo "Temperature sensors not available."
}

function inspect_user_accounts {
    echo -e "\n--- 19. Inspect Local User Accounts ---"
    cut -d: -f1 /etc/passwd
}

function audit_open_ports {
    echo -e "\n--- 20. Audit Open Ports and Listening Services ---"
    sudo netstat -tuln || ss -tuln
}

function analyze_scheduled_tasks {
    echo -e "\n--- 21. Analyze Scheduled Tasks ---"
    crontab -l || echo "No cron jobs configured for the current user."
}

# Functions for Titles 21-50
function display_kernel_modules {
    echo -e "\n--- 22. Display Kernel Modules Loaded ---"
    lsmod
}

function inspect_boot_log {
    echo -e "\n--- 23. Inspect System Boot Log ---"
    journalctl -b
}

function show_grub_configuration {
    echo -e "\n--- 24. Show GRUB Boot Configuration ---"
    cat /boot/grub2/grub.cfg
}

function check_system_time {
    echo -e "\n--- 25. Display Current System Time and Date ---"
    timedatectl
}

function test_disk_io {
    echo -e "\n--- 26. Test Disk I/O Performance ---"
    dd if=/dev/zero of=/tmp/testfile bs=1G count=1 oflag=direct
}

function list_block_devices {
    echo -e "\n--- 27. List All Block Devices ---"
    lsblk
}

function monitor_disk_health {
    echo -e "\n--- 28. Monitor Disk Health ---"
    sudo smartctl -a /dev/nvme0n1
}

function enable_firewall {
    echo -e "\n--- 29. Enable Firewall ---"
    sudo systemctl start firewalld
    sudo systemctl enable firewalld
}

function disable_firewall {
    echo -e "\n--- 30. Disable Firewall ---"
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
}

function identify_firewall_status {
    echo -e "\n--- 31. Identify Firewall Status ---"
    sudo firewall-cmd --state || echo "Firewall status not available."
}

function monitor_bandwidth {
    echo -e "\n--- 32. Analyze Network Bandwidth Usage ---"
    iftop -n
}

function trace_route {
    echo -e "\n--- 33. Trace Network Route to Host ---"
    traceroute google.com
}

function find_large_files {
    echo -e "\n--- 34. Find Large Files Consuming Disk Space ---"
    find / -type f -size +100M 2>/dev/null | head -n 10
}

function check_ssh_connections {
    echo -e "\n--- 35. Audit Active SSH Connections ---"
    who
}

function display_swap_usage {
    echo -e "\n--- 36. Analyze Swap Usage ---"
    swapon --show
}

function check_failed_logins {
    echo -e "\n--- 37. Monitor Failed Login Attempts ---"
    sudo grep "Failed password" /var/log/secure
}

function show_system_uptime {
    echo -e "\n--- 38. Display System Uptime History ---"
    uptime
}

function rebuild_bootloader {
    echo -e "\n--- 39. Rebuild Bootloader ---"
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
}

function test_port_connectivity {
    echo -e "\n--- 40. Test Port Connectivity ---"
    nc -zv google.com 443
}

function list_all_users {
    echo -e "\n--- 41. List All Users on the System ---"
    getent passwd
}

function list_all_groups {
    echo -e "\n--- 42. List All Groups on the System ---"
    getent group
}

function manage_user {
    echo -e "\n--- 43. Create or Remove a User ---"
    read -p "Do you want to create or remove a user? (create/remove): " action
    if [[ "$action" == "create" ]]; then
        read -p "Enter username to create: " username
        sudo useradd "$username" && echo "User '$username' created successfully."
        sudo passwd "$username"
    elif [[ "$action" == "remove" ]]; then
        read -p "Enter username to remove: " username
        sudo userdel "$username" && echo "User '$username' removed successfully."
    else
        echo "Invalid action. Please choose either 'create' or 'remove'."
    fi
}

function manage_group {
    echo -e "\n--- 44. Create or Remove a Group ---"
    read -p "Do you want to create or remove a group? (create/remove): " action
    if [[ "$action" == "create" ]]; then
        read -p "Enter the group name to create: " groupname
        sudo groupadd "$groupname" && echo "Group '$groupname' created successfully."
    elif [[ "$action" == "remove" ]]; then
        read -p "Enter the group name to remove: " groupname
        sudo groupdel "$groupname" && echo "Group '$groupname' removed successfully."
    else
        echo "Invalid action. Please choose either 'create' or 'remove'."
    fi
}

function show_lvm_details {
    echo -e "\n--- 45. Display LVM Configuration Details ---"
    sudo lvdisplay
}

function check_package_updates {
    echo -e "\n--- 46. Check Available Package Updates ---"
    sudo dnf check-update
}

function rebuild_firewall_rules {
    echo -e "\n--- 47. Backup and Restore Firewall Rules ---"
    sudo iptables-save > /tmp/iptables.rules && echo "Backup saved to /tmp/iptables.rules"
}

function analyze_cpu_performance {
    echo -e "\n--- 48. Analyze CPU Performance ---"
    mpstat
}

function analyze_hardware_interrupts {
    echo -e "\n--- 49. Display Hardware Interrupts ---"
    cat /proc/interrupts
}

function analyze_network_statistics {
    echo -e "\n--- 50. Show Network Packet Statistics ---"
    netstat -s
}

function analyze_memory_trends {
    echo -e "\n--- 51. Show Memory Trends in Real-Time ---"
    vmstat 1 5
}

function inspect_audio_devices {
    echo -e "\n--- 52. Display Connected Audio Devices ---"
    aplay -l
}

function display_recent_logs {
    echo -e "\n--- 53. Display Most Recent Logs ---"
    tail -n 50 /var/log/messages
}

function identify_package_status {
    echo -e "\n--- 54. Identify Any Package Status ---"
    read -p "Enter package name to check: " package_name
    # Use rpm to query all packages, and grep for the exact or partial match
    package_info=$(rpm -qa | grep -E "^$package_name(-[0-9]|$)")

    if [[ -n "$package_info" ]]; then
        echo "Package '$package_name' is installed."
        echo "Details: $package_info"
    else
        echo "Package '$package_name' is not installed."
    fi
}


function stop_service {
    echo -e "\n--- 55. Stop The Service ---"
    read -p "Enter the service name to stop: " service_name
    sudo systemctl stop "$service_name" && echo "Service '$service_name' stopped."
}

function start_service {
    echo -e "\n--- 56. Start The Service ---"
    read -p "Enter the service name to start: " service_name
    sudo systemctl start "$service_name" && echo "Service '$service_name' started."
}

function display_permissions {
    echo -e "\n--- 57. Display The Folders or Files Permissions ---"
    read -p "Enter the name of the folder or file: " file_name
    # Use find to look for files/folders and then show permissions
    results=$(find . -name "$file_name")
    
    if [[ -n "$results" ]]; then
        echo "$results" | while read -r file; do
            ls -ld "$file"   # Show detailed permissions for each file/folder
        done
    else
        echo "No folder or file named '$file_name' found."
    fi
}

function set_permissions {
    echo -e "\n--- 58. Set Specific Permissions for The Folders or Files ---"
    read -p "Enter the name of the folder or file: " file_name
    read -p "Enter the permissions to set (e.g., 755): " permissions
    # Search for the file/folder in the current directory and subdirectories
    results=$(find . -name "$file_name")
    
    if [[ -n "$results" ]]; then
        echo "$results" | while read -r file; do
            sudo chmod "$permissions" "$file" && echo "Permissions set to '$permissions' for '$file'."
        done
    else
        echo "No folder or file named '$file_name' found."
    fi
}

function reboot_system {
    echo -e "\n--- 59. Reboot The System ---"
    sudo reboot
}

function shutdown_system {
    echo -e "\n--- 60. Shutdown The System ---"
    sudo shutdown -h now
}

# Display Menu with Titles
function display_menu {
    clear
    echo "========== Assistancy Tool For Linux Operation System ========== Made By Araz Ahmadov =========="
    echo " 1. Enumerate Hostname"
	echo " 2. Modify (Set A New Hostname)"
    echo " 3. Extract Kernel Properties"
    echo " 4. Catalog CPU Specifications"
    echo " 5. Quantify Physical Memory"
    echo " 6. Assess Storage Subsystems"
    echo " 7. Profile Network Interfaces"
    echo " 8. Compile System Update History"
    echo " 9. Identify Active Services"
    echo "10. Enumerate Installed Packages"
    echo "11. Measure System Uptime"
    echo "12. Analyze File System Mount Points"
    echo "13. Evaluate Network Throughput"
    echo "14. Inspect Firewall Rules"
    echo "15. Summarize Environment Variables"
    echo "16. Catalog Connected USB Devices"
    echo "17. List Active Processes"
    echo "18. Analyze Hardware Temperature"
    echo "19. Inspect Local User Accounts"
    echo "20. Audit Open Ports and Listening Services"
    echo "21. Analyze Scheduled Tasks"
    echo "22. Display Kernel Modules Loaded"
    echo "23. Inspect System Boot Log"
    echo "24. Show GRUB Boot Configuration"
    echo "25. Display Current System Time and Date"
    echo "26. Test Disk I/O Performance"
    echo "27. List All Block Devices"
    echo "28. Monitor Disk Health"
    echo "29. Enable Firewall"
    echo "30. Disable Firewall"
	echo "31. Identify Firewall Status"
    echo "32. Analyze Network Bandwidth Usage"
    echo "33. Trace Network Route to Host"
    echo "34. Find Large Files Consuming Disk Space"
    echo "35. Audit Active SSH Connections"
    echo "36. Analyze Swap Usage"
    echo "37. Monitor Failed Login Attempts"
    echo "38. Display System Uptime History"
    echo "39. Rebuild Bootloader"
    echo "40. Test Port Connectivity"
    echo "41. List All Users on the System"
	echo "42. List All Groups on the System"
    echo "43. Create or Remove A User"
	echo "44. Create or Remove a Group"
    echo "45. Display LVM Configuration Details"
    echo "46. Check Available Package Updates"
    echo "47. Backup and Restore Firewall Rules"
    echo "48. Analyze CPU Performance"
    echo "49. Display Hardware Interrupts"
    echo "50. Show Network Packet Statistics"
    echo "51. Show Memory Trends in Real-Time"
    echo "52. Display Connected Audio Devices"
    echo "53. Display Most Recent Logs"
    echo "54. Identify Any Package Status"
	echo "55. Stop The Service"
	echo "56. Start The Service"
	echo "57. Display The Folders or Files Permissions"
	echo "58. Set Specific Permissions for The Folders or Files"
	echo "59. Reboot The System"
	echo "60. Shutdown The System"
    echo " 0. Exit"
}

# Main Menu Logic
while true; do
    display_menu
    read -p "Enter your choice (1-60, 0 to exit): " choice
    case $choice in
        1) enumerate_hostname ;;
		2) modify_hostname;;
        3) extract_kernel_properties ;;
        4) catalog_cpu_specs ;;
        5) quantify_memory ;;
        6) assess_storage ;;
        7) profile_network_interfaces ;;
        8) compile_update_history ;;
        9) identify_active_services ;;
        10) enumerate_packages ;;
        11) measure_uptime ;;
        12) analyze_mount_points ;;
        13) evaluate_network_throughput ;;
        14) inspect_firewall_rules ;;
        15) summarize_environment ;;
        16) catalog_usb_devices ;;
        17) list_active_processes ;;
        18) analyze_temperature ;;
        19) inspect_user_accounts ;;
        20) audit_open_ports ;;
        21) analyze_scheduled_tasks ;;
        22) display_kernel_modules ;;
        23) inspect_boot_log ;;
        24) show_grub_configuration ;;
        25) check_system_time ;;
        26) test_disk_io ;;
        27) list_block_devices ;;
        28) monitor_disk_health ;;
        29) enable_firewall ;;
        30) disable_firewall ;;
		31) identify_firewall_status;;
        32) monitor_bandwidth ;;
        33) trace_route ;;
        34) find_large_files ;;
        35) check_ssh_connections ;;
        36) display_swap_usage ;;
        37) check_failed_logins ;;
        38) show_system_uptime ;;
        39) rebuild_bootloader ;;
        40) test_port_connectivity ;;
        41) list_all_users ;;
		42) list_all_groups;;
        43) manage_user ;;
		44) manage_group;;
        45) show_lvm_details ;;
        46) check_package_updates ;;
        47) rebuild_firewall_rules ;;
        48) analyze_cpu_performance ;;
        49) analyze_hardware_interrupts ;;
        50) analyze_network_statistics ;;
        51) analyze_memory_trends ;;
        52) inspect_audio_devices ;;
        53) display_recent_logs ;;
		54) identify_package_status;;
		55) stop_service;;
		56) start_service;;
		57) display_permissions;;
		58) set_permissions;;
		59) reboot_system;;
		60) shutdown_system;;
        0) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option! Try again." ;;
    esac
    read -p "Press any key to return to menu..." -n1
done

