#!/bin/sh
function checkSteamcmd()
{
	echo "检查Steamcmd文件···"
	sleep 2s
	path=/home/steamcmd/steam.sh
	while [ ! -f $path ];
	do
		echo "未找到Steamcmd或Steamcmd文件不完全"
		echo "2秒开始下载Steamcmd"
		sleep 2s
		downloadSteamcmd（）	
	done
}
function downloadSteamcmd()
{	path=
	echo "正在下载Steamcmd···"
	echo "这个过程需要一点时间"
	cd /home
	cd /home/steamcmd
	rm -fr *
	wget  https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	sleep 2s
	echo "解压Steamcmd中···"
	tar -zxvf steamcmd_linux.tar.gz
}
function checkServerFile()
{
	echo "检查CSGO服务端文件···"
	path=path=/home/csgoserver/srcds_run
	while [ ! -f $path ]; 
	do
		echo "检测到CSGO服务端文件或文件不完全"
		echo "2秒后开始下载CSGO服务端文件"
		sleep 2s
		downloadCsgoFile()
	done

}
function downloadCsgoFile()
{
	cd /home/steamcmd
	echo "清理残缺文件中"
	echo "如果已经安装好了插件，这会把插件一起清理了"
	echo "不过后面插件会再次装上的"
	rm -rf /home/csgoserver/*
	echo "2秒后开始正式下载CSGO服务端文件"
	STEAM_RUNTIME=0 STEAMEXE=steamcmd ./steam.sh +login anonymous +force_install_dir /home/csgoserver +app_update 740 validate +exit
}
function checkPlugins()
{	
	echo "检测插件中"
	echo "我在写这个脚本时想过如果装插件时有问题怎么办"
	echo "其实我也没想好怎么办，应该不会出问题，出了问题就重新运行这个脚本吧"
	path=/home/csgoserver/csgo/addons/sourcemod/plugins/adminmenu.smx
	while [ ! -f $path ]; 
	do
		echo "2秒后开始下载插件"
		sleep 2s
		downloadPlugins()	
	done
}
function downloadPlugins()
{	
	echo "清理掉旧插件"
	path=/home/csgoserver/csgowarmodplugin.tar.gz
	if [ -f $path ]; 
		then
		rm -rf /home/csgoserver/csgowarmodplugin.tar.gz
	fi
	cd /home/csgoserver
	echo "2秒后开始正式下载插件"
	sleep 2s
	wget http://o8vla3xz8.bkt.clouddn.com/csgowarmodplugin.tar.gz
	echo "解压安装插件中···"
	sleep 2s
	tar	-zxvf csgowarmodplugin.tar.gz
}
function config()
{
	read -p "请输入你的服务器密钥： " value
	echo "sv_setsteamaccount   "\"$value\">>/home/csgoserver/csgo/cfg/server.cfg
	read -p "请输入OP账户的32位Steam账户（STEAM_0:1:后面的那串数字）： " account
	echo >/home/csgoserver/csgo/addons/sourcemod/configs/admins_simple.ini
	echo "\"STEAM_0:1:$account\"	\"z\"">>/home/csgoserver/csgo/addons/sourcemod/configs/admins_simple.ini
	read -p "请给服务器命名： " name
	echo >/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
	echo "\"ServerSet\"">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
	echo "{">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
    echo "    \"hostname\"">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
    echo "    {">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
    echo "            \"name\"          \"$name\"">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
    echo "    }">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
	echo "}">>/home/csgoserver/csgo/addons/sourcemod/configs/csgo_hostname.ini
}
function run()
{
	sh /home/run.sh
}
echo "即将下载Steamcmd，CSGO服务端，和插件"
echo "插件由bbs.93x.net提供"
echo "这个过程的时长可能有点长，具体时间主要由网速决定"
echo "5秒钟后开始运行"
mkdir /home/csgoserver
mkdir /home/steamcmd
sleep 5s
checkSteamcmd()
sleep 2s
checkServerFile()
sleep 2s
checkPlugins()
sleep 2s
config()
run()
