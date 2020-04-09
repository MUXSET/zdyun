#!/bin/bash
sudo apt -y install mariadb-server
sudo systemctl restart mariadb
read -p "输入回车以继续。"
/usr/bin/expect <<-EOF
spawn sudo mysql_secure_installation
expect "*none*"
send "$psswd\n"
expect "*]"
send "y\n"
expect "*password*"
send "$psswd\n"
expect "*password*"
send "$psswd\n"
expect "*]"
send "y\n"
expect "*]"
send "n\n"
expect "*]"
send "y\n"
expect "*]"
send "y\n"
expect eof
EOF
#以上为安装php和数据库
#以下为配置数据库
/usr/bin/expect <<-EOF
spawn sudo mysql -u root -p
expect "*password*"
send "$psswd\n"
expect "*none*"
send "use mysql\n"
expect "*mysql*"
send "update user set plugin='mysql_native_password';\n"
expect "*mysql*"
send "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$psswd' WITH GRANT OPTION;\n"
expect "*mysql*"
send "FLUSH PRIVILEGES;\n"
expect "*mysql*"
send "quit\n"
expect eof
EOF
sed -i 's#127.0.0.1#0.0.0.0#g' /etc/mysql/mariadb.conf.d/50-server.cnf
#到此数据库配置完成
