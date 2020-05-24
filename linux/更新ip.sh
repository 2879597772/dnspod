#!/bin/bash

#自行修改############################
token='<账号token>'
domain_id='<域名id>'
record_id='<记录id>'
sub_domain='<域名前缀>'
record_type='<域名解析方式>'
ttl='<ttl大小>'
####################################

######获取ip#######################
ip=`curl -s http://checkip.dyndns.com | sed -n 's/.*: \([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*/\1/p'`
###################################

echo 
echo 目标ip：$ip
echo 
echo 当前时间`date`
echo 

#头#################################
hard='https://api.dnspod.com/Record.Modify'
####################################

####################################
RX='user_token='$token'&format=json&record_line=default&ttl='$ttl'&domain_id='$domain_id'&record_id='$record_id'&sub_domain='$sub_domain'&record_type='$record_type'&value='$ip
####################################
curl -X POST $hard -d "$RX"
