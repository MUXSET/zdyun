#!/bin/bash
export psswd
clear
echo "开始设置root密码。"
echo ""
echo "请设置你的root密码。"
read -p "密码： " psswd
/usr/bin/expect <<-EOF
	spawn sudo passwd root
	expect "*:"
	send "$psswd\n"
	expect "*:"
	send "$psswd\n"
	expect eof
	
EOF
sudo passwd --unlock root
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo systemctl restart ssh
echo ""
echo "请再次输入root密码。。"
su -c ./jb/js.sh


