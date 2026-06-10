# Update and upgrade system
sudo apt update -y
sudo apt upgrade -y

# Install Java (Jenkins requires Java)
sudo apt install -y openjdk-17-jdk
java -version

# Add Jenkins GPG key (updated key for 2026)
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Refresh package list
sudo apt clean
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Check Jenkins status
sudo systemctl status jenkins

# Get initial admin password for setup
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
