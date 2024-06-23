
server=$1

[ -z "$server" ] && echo -e "\e[31mInput is missing --> bash $0 <server-name> \e[0m" && exit 1

ami_id="ami-031d574cddc5bb371"
sg_id="sg-0665a56c7cd09a0e0"
instance_type="t2.micro"
hostedzone_id="Z0144525QEQQSOE8RRNR"
domain_name="azcart.online"

create_instance() {
aws ec2 run-instances \              
    --instance-type ${instance_type} \    
    --image-id ${ami_id}  \    
    --security-group-ids ${sg_id}  \ 
   --instance-market-options 'MarketType=spot,SpotOptions={SpotInstanceType=persistent,InstanceInterruptionBehavior=stop}' \

   --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$component}]" "ResourceType=volume,Tags=[{Key=Name,Value=$component}]"

}
   

for component in $server
do
create_instance
done

