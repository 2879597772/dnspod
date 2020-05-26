# dnspod

#### 介绍
使用dnspod国际版的api方式实现（windows/linux）ddns更新ip

#### 注意事项
##### 本教程以及其包含的一切所有人可免费下载，完全开源，开源协议遵照“[CC-BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)”，  
[![image](https://github.com/2879597772/ONT/blob/master/images/CC.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)
##### 其意思为“知识共享-署名-非商业性-相同方式共享，即此教程共享，转发必须注明作者本人-不允许以各种方法拿此教程获利，此共享协议对中国大陆有效，受中国法律保护！

#### 软件架构
windows（需curl）  
linux

### 使用到的API

##### 获取dnspod账号token
curl -X POST 'https:api.dnspod.com/Auth' -d 'login_email=<你的账号>&login_password=<你的密码>&format=json'
##### 获取域名ID
curl -X POST 'https:api.dnspod.com/Domain.List' -d 'user_token=<你的token>&format=json'
##### 获取记录ID
curl -X POST 'https:api.dnspod.com/Record.List' -d 'user_token=<你的token>&format=json&domain_id=<域名id>'
##### 修改记录
curl -X POST 'https://api.dnspod.com/Record.Modify' -d 'user_token=<你的token>&format=json&record_line=default&ttl=<ttl大小>&domain_id=<域名id>&record_id=<记录id>&sub_domain=<域名前缀>&record_type=<域名解析方式>&value=<域名解析值>'  
`域名解析方式：A CNAME MX TXT NS AAAA SRV URL Framed URL`  
`域名前缀：你域名记录的前缀，如www.baidu.com中的www`  
`域名解析值：根据域名解析方式输入，如下：`  
`A: 填写您服务器 IPv4地址（如：8.8.8.8），如果您不知道，请咨询您的空间商。`  
`CNAME: 填写一个域名，如：baidu.com`  
`MX: 填写您邮件服务器的IP地址或企业邮局给您提供的域名，如果您不知道，请咨询您的邮件服务提供商。`  
`TXT：在这里可以填写任何东西，长度限制255。绝大多数的TXT记录是用来做SPF记录（反垃圾邮件）。`
`Dominant URL: 重定向网站，例如http://www.google.com。`  
`Recessive URL:您需要引用其内容的网站。`  
`AAAA：解析到 IPv6 的地址，例如：ff06:0:0:0:0:0:0:c3`
`NS：NS向下授权，填写dns域名，例如：f1g1ns1.dnspod.net `  
`SRV：格式为：优先级、空格、权重、空格、端口、空格、主机名，5 0 5269 example.fff.cn，记录生成后会自动在域名后面补一个“.”，这是正常现象。`
##### 添加记录
curl -X POST 'https://api.dnspod.com/Record.Create' -d 'user_token=<你的token>&format=json&domain_id=<域名id>&sub_domain=<域名前缀>&record_type=<域名解析方式>&value=<域名解析值>'
##### 删除记录
curl -X POST 'https://api.dnspod.com/Record.Remove' -d 'user_token=<你的token>&format=json&domain_id=<域名id>&record_id=<记录id>'
##### API注意事项
如果5分钟内登录失败超过30次，则该帐户将被禁用重新登录一个小时。  
仅接受POST方法。  
请使用UTF-8编码进行数据传输。响应也是UTF-8编码的。  
请求网址以基于SSL，您必须使用“ https”而不是“ http”。  
滥用：  
这将被视为API滥用。包括但不限于：  
在短时间内进行大量插入，删除，更新或刷新。  
要求很多而无需更改任何内容。你在想什么！  
错误逻辑或无限循环导致太多无用或重复的请求。  
其他要求可能会给我们带来很大压力。  
为了确保您和其他开发人员的利益，请合法使用我们的API。DNSPod将通过禁止帐户来惩罚API滥用等行为，并保留所有仲裁权利。  
###### 以上内容摘自dnspod.com

#### 相关脚本已加入windows/linux目录下
请自行获取以下内容：  
账户token  
域名id  
记录id  
