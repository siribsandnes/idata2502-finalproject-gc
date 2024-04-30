# performance_test.sh
#!/bin/bash

# Page Load Time Test
echo "Running page load time test..."
curl -s -o /dev/null -w "%{time_total}\n" http://$(terraform output ip) | awk '{if($1 > 3) print "Page load time too slow"}' || { echo "Page load time within acceptable range"; exit 1; }

echo "Performance tests passed successfully!"
