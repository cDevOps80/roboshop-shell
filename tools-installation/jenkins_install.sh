tool="jenkins"
source common.sh

> $LOG_FILE

cat << EOF > /etc/yum.repos.d/jenkins.repo
[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1
EOF
status_check "Adding jenkins repo file"

dnf install fontconfig java-17-openjdk -y &>> $LOG_FILE
status_check "Installing java-17"

dnf install jenkins -y &>> $LOG_FILE
status_check "Installing jenkins"

systemctl daemon-reload &>> $LOG_FILE
status_check "Restarting system"

systemctl enable jenkins &>> $LOG_FILE
status_check "Enable jenkins service"

systemctl start jenkins &>> $LOG_FILE
status_check "Starting jenkins service"


