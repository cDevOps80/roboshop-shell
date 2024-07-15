tool="terraform"
source common.sh

yum install -y yum-utils
status_check "Installing yum-utils package"

yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
status_check "Adding terraform repo-file"

yum -y install terraform
status_check "Installing terraform"