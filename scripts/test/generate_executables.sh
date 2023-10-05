#!/bin/bash

# Get the directory where the script is located
script_dir="$(dirname "$0")"

# Change to the script's directory
cd "$script_dir"

# Create 10 test executable files
for i in {1..10}; do
    echo '#!/bin/bash' > "test_$i.sh"
    echo "echo 'Running test_$i.sh...'" >> "test_$i.sh"
    echo "sleep 2" >> "test_$i.sh"
    chmod +x "test_$i.sh"
done

echo "Test executable files generated."