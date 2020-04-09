#!/bin/bash
sudo apt -y install apache2
sudo apt -y install php php7.3-curl php7.3-mbstring php7.3-gd php7.3-fpm php7.3-mysql libapache2-mod-php
sudo service php7.3-fpm restart
sudo service apache2 restart
#以下为安装可道云
sudo rm /var/www/html/index.html
sudo tar zxvf ./jb/yun.tar.gz -C /var/www/html/
sudo chmod -R 777 /var/www/html/
clear
#以上为安装可道云完成
if [ "$sjk" = "1" ]; then
echo "是否安装数据库？"
while :
 do
   read -p "请输入yes or no: " yesorno4
   if [ ! -n "$yesorno4" ]; then
   echo "WDNMD让你输入yes or no！" 
   elif [ $yesorno4 = "yes" ]; then
 	./jb/mysql.sh
        break
   elif [ $yesorno4 = "no" ]; then
	break          
   else
	echo "WDNMD让你输入yes or no，你非要输入别的？" 
   fi
 done
else
echo "你选择了不安装数据库。"
echo -e "\n\n\n\n\n"
fi

