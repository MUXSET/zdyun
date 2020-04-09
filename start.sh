#!/bin/bash
sudo chmod +x ./jb/php.sh
sudo chmod +x ./jb/mysql.sh
sudo chmod +x ./jb/root.sh
sudo chmod +x ./jb/hy.sh
sudo chmod +x ./jb/hs.sh
sudo chmod +x ./jb/js.sh
echo "你好这是一个自动部署可道云的脚本!"
echo "如果你想要安装请输入yes并回车。"
echo "如果你不想安装请输入no并回车。"
echo ""
while :
do
   read -p "请输入yes or no: " yesorno1
   if [ ! -n "$yesorno1" ]; then
   echo "WDNMD让你输入yes or no！" 
   elif [ $yesorno1 = "yes" ]; then
        break
   elif [ $yesorno1 = "no" ]; then
	echo "WDNMD不安装你打开干什么！"
           exit
else
echo "WDNMD让你输入yes or no，你非要输入别的？" 
   fi
done
#yes or no2
echo ""
echo "是否需要换源？"
echo ""
while :
do
   read -p "请输入yes or no: " yesorno2
   if [ ! -n "$yesorno2" ]; then
   echo "WDNMD让你输入yes or no！" 
   elif [ $yesorno2 = "yes" ]; then
        bash ./jb/hy.sh
        break
   elif [ $yesorno2 = "no" ]; then
	break          
else
echo "WDNMD让你输入yes or no，你非要输入别的？" 
   fi
done
#yes or no 2
echo ""
echo "是否需要root？(root后可以选择安装数据库。)"
echo ""
export sjk
while :
do
   read -p "请输入yes or no: " yesorno3
   if [ ! -n "$yesorno3" ]; then
   echo "WDNMD让你输入yes or no！" 
   elif [ $yesorno3 = "yes" ]; then
        sjk="1"
        bash ./jb/root.sh
        break
   elif [ $yesorno3 = "no" ]; then
	sjk="0"
        ./jb/js.sh
	break         
else
echo "WDNMD让你输入yes or no，你非要输入别的？" 
   fi
done
#yes or no3


