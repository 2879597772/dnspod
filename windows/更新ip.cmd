@echo off
::###################################
::取本机ip并赋值
for /F %%i in ('curl https://server.feirenzai.club:4433/ip.php') do ( set newip=%%i)
::https://server.feirenzai.club:4433/ip.php为获取当前ip的api，你可以找一个可以直接返回ip的api（此api为自建api，请避免滥用）
::###################################
echo.
echo 目标ip：%newip%
echo.
echo 当前时间&date /t&time /t
::请自行获取以下内容：
::账户token
::域名id
::记录id
curl -X POST "https://api.dnspod.com/Record.Modify" -d "user_token=<你的token>&format=json&record_line=default&ttl=<ttl大小>&domain_id=<域名id>&record_id=<记录id>&sub_domain=<域名前缀>&record_type=<域名解析方式>&value=%newip%"
echo.
::正常使用下可把pause删除/注释掉
pause
