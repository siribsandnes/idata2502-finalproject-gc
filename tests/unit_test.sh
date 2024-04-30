# unit_test.sh
#!/bin/bash

# Script Execution Test
echo "Running script execution test..."
sudo bash /var/www/html/index.html > /dev/null 2>&1 || { echo "Script execution failed"; exit 1; }

# HTML File Existence Test
echo "Running HTML file existence test..."
[ -f /var/www/html/index.html ] || { echo "HTML file not found"; exit 1; }

echo "Unit tests passed successfully!"