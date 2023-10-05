#!/bin/bash

# Password storage file
password_file="/workspaces/docker_shell_scripting/scripts/test/passwords.txt"

# Function to encrypt the file
file_encrypt() {
    # Input file and passphrase
    input_file="$password_file"
    passphrase="MySuperSecretPassphrase"

    # Encrypt the file
    openssl enc -aes-256-cbc -in "$input_file" -out "${input_file}.enc" -pass "pass:$passphrase" 2>/dev/null

    #echo "File encrypted as ${input_file}.enc"
}

file_decrypt() {
    # Encrypted file and passphrase
    encrypted_file="$password_file.enc"
    passphrase="MySuperSecretPassphrase"

    # Decrypt the file
    openssl enc -d -aes-256-cbc -in "$encrypted_file" -out "${encrypted_file%.enc}" -pass "pass:$passphrase" 2>/dev/null

    #echo "File decrypted as ${encrypted_file%.enc}"
}

# Function to securely store a new password
add_password() {
    file_decrypt
    read -p "Enter a username: " username
    read -sp "Enter a password: " password
    echo "$username:$password" >> "$password_file"
    echo "Password added for $username."
    file_encrypt
    rm "$password_file"
}

# Function to retrieve a password
get_password() {
    read -p "Enter the username: " username
    file_decrypt
    password=$(grep "^$username:" "$password_file" | cut -d ":" -f 2)
    if [ -n "$password" ]; then
        echo "Password for $username: $password"
    else
        echo "Password not found for $username."
    fi
    file_encrypt
    rm "$password_file"
}

# Function to update a password
update_password() {
    read -p "Enter the username: " username
    password=$(grep "^$username:" "$password_file" | cut -d ":" -f 2)
    if [ -n "$password" ]; then
        read -sp "Enter a new password: " new_password
        sed -i "s/^$username:$password$/$username:$new_password/" "$password_file"
        echo "Password updated for $username."
    else
        echo "Password not found for $username."
    fi
}



# Menu for password manager
while true; do
    echo "Password Manager Menu:"
    echo "1. Add Password"
    echo "2. Retrieve Password"
    echo "3. Update Password"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            add_password
            ;;
        2)
            get_password
            ;;
        3)
            update_password
            ;;
        4)
            echo "Exiting Password Manager."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done
