# integration_test.sh
#!/bin/bash


# Nginx Service Test
echo "Running Nginx service test..."
sudo systemctl status nginx | grep -q "Active: active" || { echo "Nginx service not running"; exit 1; }

# Website Content Test
echo "Running website content test..."
curl -s http://$(terraform output ip) | grep -q "Welcome to My Website Hosted on Google Cloud VM" || { echo "Website content not found"; exit 1; }

echo "Integration tests passed successfully!"
