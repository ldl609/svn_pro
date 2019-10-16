

						yum安装及设置svn服务器

1.通过yum安装subversion
#yum install -y subversion

2.检查subversion是否安装成功
#svn  --version

3.subversion默认/var/svn作为数据目录,可通过/etc/sysconfig/svnserver修改这个位置
#vim /etc/sysconfig/svnserve

4.创建版本库(项目),这里数据根目录采用默认的/var/svn,创建版本库名称为svntest
#mkdir  -p /var/svn/svntest
#svnadmin create /var/svn/svntest

5.建立的版本库"/var/svn/svntest"目录及相关配置文件说明,
<1>/var/svn/svntest/conf 目录为配置文件存放目录
	-authz				负责账号权限的管理，控制账号是否读写权限
	-passwd				负责账号和密码的用户名单管理
	-svnserve.conf		svn服务器配置文件
<2>/var/svn/svntest/db	存放项目文件的目录

6.添加用户及密码,编辑文件/var/svn/svntest/conf/passwd增加一个admin的用户密码为admin,可自定义用户及其密码
#vim   /var/svn/svntest/conf/passwd
[users]
admin = admin
liudl = 123456

7.设置用户权限,编辑文件/var/svn/svntest/conf/authz
#vim /var/svn/svntest/conf/authz
[/]
admin = rw	#设置用户admin可读可写
liudl = r	#设置用户liudl只读	

8.配置svn,编辑文件/var/svn/svntest/conf/svnserve.conf修改以下内容(注意:配置的前面不能有空格,一定要顶格写)
#vim /var/svn/svntest/conf/svnserve.conf
anon-access = none			#表示禁止匿名用户访问可选值有(none,write,read)
auth-access = write			#表示授权用户拥有读写权限
password-db = passwd		#指定用户名口令文件,即"/var/svn/svntest/conf/passwd"文件
authz-db = authz			#指定权限配置文件,即"/var/svn/svntest/conf/authz"文件
realm = /var/svn/			#指定认证域,这里即为"/var/svn/"目录

9.开放3690端口两种方法,择其一即可
<1>关闭防火墙
#systemctl stop firewalld		#停止防火墙
#systemctl disable  firewalld	#取消防火墙开机启动
<2>添加3690端口到白名单
#firewall-cmd --zone=public --add-port=3690/tcp --permanent  # 永久开放端口3690
#firewall-cmd --reload  # 重新载入规则

10.启动svn服务,并设为开机启动
#systemctl start svnserve.service
#systemctl enable svnserver

11.查看svn服务是否启动成功以及3690端口是否打开
#ps aux | grep svn				
#netstat -tnlp | grep 3690

12.客户端测试
<1>windows下载TortoriseSVN然后右键选择"svn checkout"
-在"URL of repository"栏填写"svn://192.168.0.110:3690/svntest"
-"checkout directory"栏选择或填写checkuot的目录
-其他默认点击"OK",然后弹出用户登录框填写即可

<2>linux下测试
-输入以下指令将文件checkout到本机/root/testsvn
#svn co svn://192.168.0.110/svntest  /root/testsvn











