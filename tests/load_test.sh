# load_test.sh
#!/bin/bash

# Concurrency Test
echo "Running concurrency test..."
ab -n 100 -c 10 http://$(terraform output ip)/ | grep -q "Complete requests:      100" || { echo "Concurrency test failed"; exit 1; }

echo "Load tests passed successfully!"
