# CSGOserver
这是几个用来在CentOS上装CSGO服务端的玩意儿
仅限于CentOS的root用户操作
## 忘了说，这是一个满十服
## 而且不能是独立服务器，独立服务器是需要改东西的，怎么改我就不知道了
### 首先要把三个脚本弄到/home里去，注意路径别错了
为什么是/home呢，因为/home里基本不会有啥东西，所以脚本里都是按照/home里跑的<br/>
我本来想弄一个脚本里去，突然想到了本来下载的东西就多，万一以后想更新什么的，跑起来耗的流量不少啊，毕竟阿里云1G要1块钱</br>
### 然后运行那个start.sh就慢慢等吧
### 插件是从X社区搞来的，所以跑起来会看到他们的广告
### 至于更新，会自动更新的，自动更新出问题了，，不知道，不管我的事
## gl hf
## cyka blyat
### 我觉得不能这样啥都不说啊，真有小白看不明白怎么办呢
首先执行<code>cd /home</code>这条命令，然后执行下面三条：
<code>wget https://raw.githubusercontent.com/ech0l1u/CSGOserver/master/startInstall.sh</code><br/>
<code>wget https://raw.githubusercontent.com/ech0l1u/CSGOserver/master/serverInstall.sh</code><br/>
<code>wget https://raw.githubusercontent.com/ech0l1u/CSGOserver/master/run.sh</code>
<br/>再然后执行<code>sh startInstall.sh</code>这条命令就行了

啊不行啊，玩意某个小白用了某家特别缺德的CentOS 7 x64呢？卧槽那简直是人间悲剧啊！啊！<del>此处请作易中天表情</del>
<br/>没错我说的就是Vultr家。所以服务器的操作系统最好是CentOS 6 x86</br>如果说有问题，叫个大手子把系统防火墙和iptables之类的，把要开放的端口（这脚本里默认是27015）TCP和UDP都打开。
说了这么多感觉仁至义尽了，如果有兴趣的话，可以去<a href="https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers">V社官方教程</a>看看，虽然官方文档很难看，但是最起码不会出错啊.
-----------
当然官方会把很多<a href="https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers#Advanced_Configuration">高级设置</a>都告诉你，而这个就比较简陋了
### 卧槽漏了一件很重要的事情了
果然记性越来越不好了，就是把服务端装完后需要的那个服务器密钥，就是首先准备一个买了CSGO而且绑定了手机而且没有被VAC过的账号，去<a href=" http://steamcommunity.com/dev/managegameservers">这里</a>登录，然后在App ID里填上730，备忘录什么的随便填，点创建，然后出现的游戏令牌那串全大写字母和数字混合的东西。我不知道这个填错了会怎么样，我知道不填的话，服务器弄好后只能局域网访问。<br/><br/><br/>差点就又忘了个东西，那就是建好后进去。很简单，进游戏，开控制台，输入<code>connect 这个服务器的IP:27015</code>就行了
