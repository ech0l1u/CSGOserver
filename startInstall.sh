#!/bin/sh
echo "检查用户权限"
if id |grep "^uid=0(root)">/dev/null ;
	then 
		echo "----------"
		echo "确定为root用户"
		echo "请确保/home具有15GB空间，最好是有20GB"
	else 
		echo "当前登陆账户不是root"
		echo "GG"
		echo "请用root账户登录，或者使用su root 命令切换到root账户"
		sleep 8s
		exit 0
fi 

echo "检查操作系统···"
sleep 3s
if rpm -q centos-release | grep centos; 
	then
		echo "操作系统为CentOS"
		echo "顺便帮你更新一下"
		sleep 2s
		yum -y update
	else
		echo "检测到操作系统不是CentOS，请去换个操作系统"
		echo "此脚本GG，5秒后退出"
		sleep 5s
		exit 0
fi

echo "检测系统版本···"
sleep 2s
ldconfig
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; 
	then
		echo "检测到系统为64位，需要安装32位运行库"
		echo "5秒后安装开始"
		sleep 5s
		yum -y install xulrunner.i686
	else
	   echo "系统是32位系统"
fi

echo "帮你安装一个等会服务器跑起来后让ssh界面不那么乱的东西"
yum -y install screen
sleep 2s

echo "准备启动CSGO服务端下载"
cd /home
chmod 777 *
sleep 3s
sh /home/serverInstall.sh


