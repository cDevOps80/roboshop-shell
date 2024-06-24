R="\e[31m"
G="\e[32m"
N="\e[0m"
LOG_FILE="/tmp/${tool}.log"

status_check(){
    [ $? -ne 0 ] && echo -e "$R $1 is failed\ncheck more information in $LOG_FILE file $N" && exit 1 || echo -e "$G $1 is success $N"
}