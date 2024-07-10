aws ec2 run-instances \
    --image-id ami-04629cfb3bd2d73f3 \
    --instance-type t2.micro \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=webserver}]' \
    --security-group-ids sg-098c66671a7255c8e \
    --user-data file://my_script.txt \
    --key-name bhanu