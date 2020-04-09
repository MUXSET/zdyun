#!/bin/bash
echo ""
read -p "按回车开始安装。"
clear
echo "---------------------------------------正在开始安装可道云------------------------------------------------------------------------------"
	./jb/php.sh
clear
ip=$(ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:")
echo "安装完成！可以通过以下链接访问你的个人云盘。"
echo "耶！"
echo "http://$ip/yun/"
echo -e "\n\n\n"
echo -e "\n\n\n\n\n\n\n\n"
echo "到此安装完成，感谢使用！"
echo "                                       by NOSET"


