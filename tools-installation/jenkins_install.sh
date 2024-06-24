tool="jenkins"
source common.sh

> $LOG_FILE

cat << EOF > /etc/yum.repos.d/jenkins.repo
[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=0
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

jenkins_password=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
cat /var/lib/jenkins/secrets/initialAdminPassword >> /tmp/jenkins_password
status_check "Catching jenkins initial admin password into a file  --> /tmp/jenkins_password <-- future reference"

echo -e "\n$C Prompting jenkins intitial admin password"
echo " ------------------------------"
echo " $jenkins_password"
echo -e " ------------------------------$N"
