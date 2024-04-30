# regression_test.sh
#!/bin/bash

# Rebuild Test (change machine type)
echo "Running rebuild test..."
terraform apply -auto-approve -var="machine_type=n1-standard-1" > /dev/null 2>&1 || { echo "Rebuild test failed"; exit 1; }

echo "Regression tests passed successfully!"
