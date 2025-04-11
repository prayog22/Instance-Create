#!/bin/bash

# Update the system
apt-get update
apt-get upgrade -y

# Install Apache
apt-get install -y apache2

# Ensure Apache is started and enabled
systemctl start apache2
systemctl enable apache2

# Create a simple index.html page
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Apache Server - Terraform Deployed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .container {
            background-color: #f5f5f5;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Apache Server Successfully Deployed!</h1>
    <div class="container">
        <p>This Apache web server was deployed using Terraform and AWS EC2.</p>
        <p>Running on Ubuntu 20.04</p>
        <p>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p>
        <p>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</p>
    </div>
</body>
</html>
EOF

# Set appropriate permissions
chmod 644 /var/www/html/index.html

# Print confirmation message to log
echo "Apache installation and configuration completed."