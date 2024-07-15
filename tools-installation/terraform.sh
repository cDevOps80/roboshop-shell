tool="terraform"
source common.sh

yum install -y yum-utils &>> $LOG_FILE
status_check "Installing yum-utils package"

yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo &>> $LOG_FILE
status_check "Adding terraform repo-file"

yum -y install terraform &>> $LOG_FILE
status_check "Installing terraform"