# security_test.sh
#!/bin/bash

# Firewall Rule Test
echo "Running firewall rule test..."
gcloud compute firewall-rules describe allow-http --format='value(allowed[].IPProtocol)' | grep -q "tcp" || { echo "Firewall rule not configured"; exit 1; }

# HTTPS Redirect Test (assuming Nginx is configured for HTTPS)
echo "Running HTTPS redirect test..."
curl -s -I http://$(terraform output ip) | grep -q "HTTP/1.1 301 Moved Permanently" || { echo "HTTPS redirect not working"; exit 1; }

echo "Security tests passed successfully!"
