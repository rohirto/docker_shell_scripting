# if file is present (.profile file)
if [ -f .profile ]
then 
    echo "There is a .profile in this dir"
else
    echo "no .profile file"
fi

# change to home
# Get the directory where the script is located
home_dir="/home"

# Change to the script's directory
cd "$home_dir"

#alternatively test command

if test -f .profile
then
    echo "There is a .profile in this dir"
else
    echo "no .profile file"
fi