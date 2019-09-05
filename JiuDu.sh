#!/bin/bash
until
        echo "                         ＼　／"
        echo "                  ┏━━━━━━ ＼／ ━━━━━━━┓"
        echo "                  ┃ ┏━━━━━━━━━━━━━━━┓ ┃"
        echo -e                 "                  ┃ ┃\033[44;37m   菜单主页    \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[1]安装基础工具\033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[2]替换成清华源\033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[3]修改Zsh主题 \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[4]修改问候语  \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[5]安装ssh     \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[6]Python环境  \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[7]MariaDB安装 \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[8]搭建网站环境\033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[9]搭建内网穿透\033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[10]搭WordPress\033[0m"┃ ┃
	echo -e                 "                  ┃ ┃\033[44;37m[11]刷流量代码 \033[0m"┃ ┃
        echo -e                 "                  ┃ ┃\033[44;37m[0]退出菜单    \033[0m"┃ ┃
        echo "                  ┃ ┗━━━━━━━━━━━━━━━┛ ┃"
        echo "                  ┗━━━━∪━━━━━━━━━∪━━━━┛"
        echo "[如需执行其他选项，请先安装工具包，工具包默认打开root]"
        echo -e "[\033[34m输\033[0m\033[31m入\033[0m\033[32m模\033[0m\033[33m式\033[0m]:"
        read zhongduan
        test $zhongduan = 0
        do
                case $zhongduan in
1)read -p "是否执行选项[1]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在安装中..请耐心等待..\033[0m"       
                sleep 2
pkg install vim -y
pkg install vim-python -y
pkg install curl -y
pkg install wget -y
pkg install git -y
pkg install unzip -y
pkg install unrar -y
pkg install nmap -y
pkg install proot -y
                echo -e "\033[32m[基础工具安装成功]\033[0m"
                echo -e "\033[32m工具包含:vim.vim-python.curl.wget.git.unzip.unrar.proot\033[0m"
else
                echo -e "\033[31m[基础工具安装失败]\033[0m"
fi
termux-chroot;;

2)read -p "是否执行选项[2]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"
fi
                sleep 2
echo "# The termux repository mirror from TUNA:
deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main" > $PREFIX/etc/apt/sources.list
if [ $? -eq 0 ];then
                echo -e "\033[32m[清华源替换成功]\033[0m"
else
                echo -e "\033[31m[清华源替换失败]\033[0m"
fi;;

3)#搬
read -p "是否执行选项[3]y/n?" a
if [ $a == y ];then
echo -e "\033[32m[安装时间较长,请耐心等待]\033[0m"
echo -e "\033[32m正在执行..\033[0m"
sleep 2
cd
echo "#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
apt install -y git zsh
git clone https://github.com/Cabbagec/termux-ohmyzsh.git "$HOME/termux-ohmyzsh" --depth 1

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

chsh -s zsh

echo "oh-my-zsh install complete!\nChoose your color scheme now~"
$HOME/.termux/colors.sh

echo "Choose your font now~"
$HOME/.termux/fonts.sh

echo "Please restart Termux app..."

exit   " >JiuDv.sh
else		  echo -e "\033[32m[已取消]\033[0m"
fi
echo -e "\033[32m下载完成,正在安装..\033[0m"
sleep 1
bash JiuDv.sh
if [ $? -eq 0 ];then
                echo -e "\033[32m[执行成功]\033[0m"
else
                echo -e "\033[31m[执行失败]\033[0m"
fi
cd
rm -rf JiuDv.sh;;

4)read -p "是否执行选项[4]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"
	sleep 2
echo "                  ＼　／" > $PREFIX/etc/motd
echo "             ┏━━━━ ＼／ ━━━━━┓" >> $PREFIX/etc/motd
echo "             ┃ ┏━━━━━━━━━━━┓ ┃" >> $PREFIX/etc/motd
echo "             ┃ ┃ 欢迎 使用 ┃ ┃" >> $PREFIX/etc/motd
echo "             ┃ ┃Termux高级!┃ ┃" >> $PREFIX/etc/motd
echo "             ┃ ┗━━━━━━━━━━━┛ ┃" >> $PREFIX/etc/motd
echo "             ┗━━━∪━━━━━━━∪━━━┛" >> $PREFIX/etc/motd
echo "  使用包：" >> $PREFIX/etc/motd
echo "                  * 查端口 :nmap <网址> [基于基础工具]" >> $PREFIX/etc/motd
echo "                  * 搜索包 :pkg search <query>" >> $PREFIX/etc/motd
echo "                  * 安装包 :pkg install <package>" >> $PREFIX/etc/motd
echo "                  * 升级包 :pkg upgrade" >> $PREFIX/etc/motd
echo "                  * 卸载包 :pkg uninstall <package>" >> $PREFIX/etc/motd 
echo "" >> $PREFIX/etc/motd 
echo "" >> $PREFIX/etc/motd 
echo -e "\033[32m[写入成功]\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
fi;;

5)echo -e "\033[31m[说明:内网穿透了才能进行无线远程]\033[0m"
read -p "是否执行选项[5]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"
	sleep 2
pkg install openssh -y
pkg install net-tools -y
echo -e "\033[33m开启:sshd\033[0m"
echo -e "\033[33m远程连接:用户名@IP -p 端口\033[0m"
echo -e "\033[33m查看用户名:whoami\033[0m"
echo -e "\033[33m查看IP:ifconfig\033[0m"
echo -e "\033[33mssh默认端口:8022\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
echo -e "\033[32m[设置用户密码]:\033[0m"
passwd 
fi;;

6)echo -e "\033[31m[该脚本为半自动脚本,请观看屏幕进行操作]\033[0m"
read -p "是否执行选项[6]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"
	sleep 2
pkg install python2 -y
pkg install python -y
read -p "[请手动登入python2和python查看版本号;如版本号为:python3.6.5则输入3.6]:Enter进行下一步"
echo -e "\033[32m准备中..安装过程请耐心等待...\033[0m"
sleep 2
read -p "[请输入python2的版本号]:" why
python$why -m pip install --upgrade pip
read -p "[请输入python的版本号]:" wht
python$wht -m pip install --upgrade pip
pkg install clang -y
pip$why install ipython
pip$wht install ipython
pkg install vim-python -y
echo "
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030" >.vimrc
source .vimrc
echo -e "\033[32m[安装完成]\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
fi;;

7)read -p "是否执行选项[7]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"       
                sleep 2
pkg install mariadb tmux -y
mysql_install_db
read -p "[打开新会话并输入mysqld挂后台执行]:已执行此操作,并回车(Enter)进入下一步"
echo -e "

{提示}
=================================================== ]
[1]\033[32mEnter current password for root (enter for none):\033[0m
	\033[31m输入当前输入密码 ; 因为是空密码,这里默认 回车\033[0m
=================================================== ]
[2]\033[32mSet root password? [Y/n] y\033[0m
	\033[31m设置新密码 ; 这里设置新的root密码\033[0m
=================================================== ]
[3]\033[32mRemove anonymous users? [Y/n] Y\033[0m
	\033[31m是否移除匿名用户\033[0m
=================================================== ]
[4]\033[32mDisallow root login remotely? [Y/n] n\033[0m
	\033[31m是否不允许root远程登录\033[0m
=================================================== ]
[5]\033[32mRemove test database and access to it? [Y/n] n\033[0m
	\033[31m是否移除test数据库\033[0m
=================================================== ]
[6]\033[32mReload privilege tables now? [Y/n] y\033[0m
	\033[31m是否重新加载表的权限\033[0m
=================================================== ]

"

read -p "[(查看用户名:whoami)输入用户名]" d
mysql_secure_installation -u$d
echo -e "\033[32m[执行成功]\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
fi;;

8)echo -e "\033[31m[输入termux-chroot命令开启root;再进行此脚本,否则会执行失败]\033[0m"
read -p "是否执行选项[8]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"
                sleep 1
echo -e "\033[32m准备安装php..\033[0m"
sleep 1 
pkg install php -y
echo -e "\033[32m[安装完成]\033[0m"
                sleep 1
echo -e "\033[32m准备安装nginx..\033[0m"
sleep 1 
pkg install nginx -y
sed -in 's/index  index.html index.htm;/index  index.html index.htm index.php;/g' /etc/nginx/nginx.conf
sed -in '64,71s/#//g' /etc/nginx/nginx.conf
sed -in 's/fastcgi_param  SCRIPT_FILENAME .*$fastcgi_script_name;/fastcgi_param  SCRIPT_FILENAME  \/usr\/share\/nginx\/html$fastcgi_script_name;/' /etc/nginx/nginx.conf && echo -e "\033[32m[nginx.conf替换成功]\033[0m" || echo -e "\033[31m[nginx.conf替换失败]\033[0m"
echo -e "\033[32m[安装完成]\033[0m"
sleep 1 
nginx
netstat -an |grep 8080
read -p "[查看8080端口是否在运行,以及本地访问127.0.0.1:8080是否可以访问]:访问成功,并回车(Enter)进行下一步"
fuser -k 8080/tcp
nginx -s reload
                sleep 1
echo -e "\033[32m准备安装php-fpm..\033[0m"
sleep 1 
pkg install php-fpm -y
echo -e "\033[32m[安装完成]\033[0m"
sleep 1
sed -in 's/\/data\/data\/com.termux\/files\/usr\/var\/run\/php-fpm.sock/127.0.0.1:9000/g' /etc/php-fpm.d/www.conf && echo -e "\033[32m[listen替换成功]\033[0m" || echo -e "\033[31m[listen替换失败]\033[0m"

echo -e "\033[31m[nginx默认的网站根目录为]:/data/data/com.termux/files/usr/share/nginx/html\033[0m"
sleep 1
php-fpm
nginx
sleep 2
echo -e "\033[32m[执行成功]\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
fi;;

9)read -p "是否执行选项[9]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"       
                sleep 2
echo "
[浏览器访问 ngrok网站] 
[网站]:http://www.ngrok.cc
{提示}
自行注册两个账号,并购买一个免费的服务
填写信息参照:
[隧道协议]: http
[隧道名称]: 随便写
[前置域名]: 如：www.baidu.com www就是前置域名
[本地端口]: 填写本地服务器地址	如：127.0.0.1:8080"
read -p "[设置完成后,回车进行下一步]"
cd
mkdir ngrok
cd ngrok
wget https://Elimincuzf.github.io/python-ngrok.zip
unzip python-ngrok.zip
rm -rf python-ngrok.zip
read -p "[输入隧道id (隧道id在ngrok官网查看)]:" e
python sunny.py --clientid=$e
echo -e "\033[32m[内网穿透搭建成功]\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
fi
echo -e "\033[32m[可通过 python sunny.py --clientid=隧道id (隧道id在ngrok官网查看)]\033[0m"
;;

10)read -p "是否执行选项[10]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"       
                sleep 2
fuser -k 8080/tcp
cd /usr/share/nginx/
rm -rf html/*
wget https://cn.wordpress.org/wordpress-4.9.4-zh_CN.zip
unzip wordpress-4.9.4-zh_CN.zip
mv wordpress/* html/
rm -rf wordpress
rm -rf wordpress-4.9.4-zh_CN.zip
php-fpm
nginx && nginx -s reload
sleep 3
echo -e "\033[32m[执行成功]\033[0m"
else
echo -e "\033[32m[已取消]\033[0m"
fi;;

11)read -p "是否执行选项[11]y/n?" a
if [ $a == y ];then
echo -e "\033[32m正在执行..\033[0m"       
                sleep 2
cd
echo "pkg install wget -y

i=0

while [ $((i++)) -le 999 ]

do

wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk 

done" > sll.sh
echo -e "\033[32m[开始执行]\033[0m"
sleep 2
bash sll.sh
else
echo -e "\033[32m[已取消]\033[0m"
fi;;

0)echo "请选择输入 (0-11)"
esac
done





































