# Shell script takes arguments as "$1", "$2" and so on
# print the arguments in reverse
echo "$2" "$1"

# no of arguments entered are stored in $#
echo "No of args: $#"


echo "Last command Value: $?"

# to print command itself enter $0 -> 0th before 1st
echo "First word $0"

# To print the values of all arguments entered
echo "All args: $*"

# alternatively to enter the values of all arguments entered
echo "All args 2: "
echo "$@"

# Command Substitution is done using $() -> ie if you want store command op in some variable
echo "$(pwd)"

# Alternatively use back quotes ``
echo `pwd`

# Backslashes used for escape character
echo "This is a \"quote\"."


echo 'logging off'