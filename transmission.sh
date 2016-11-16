#!/bin/bash
read -p "Password : " pass
# Variable
IP=`curl -s ifconfig.me`;

# OS bit
OS=`uname -p`;

# install EPEL
if [ "$OS" == "x86_64" ]; then
	wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
	rpm -ivh epel-release-6-8.noarch.rpm
else
  wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
  rpm -ivh epel-release-6-8.noarch.rpm
  
#Install Transmission
yum -y install transmission*
service transmission-daemon start
service transmission-daemon stop

#Install Web Server
yum -y install httpd
service httpd start
service httpd stop
cd /var/www/html
mkdir /var/www/html/download
ln -s /var/lib/transmission/download
cd

#html template
echo "<html><head><title>Transmission Torrent</title></head><body>" | tee /home/vps/public_html/index.html
echo "<h1 style="text-align:center;">Selamat Menggunakan Transmission Torrent Leech</h1>" | tee /home/vps/public_html/index.html
echo "<p style="text-align:center;">" | tee /home/vps/public_html/index.html
echo "<a style="background-color: #4CAF50;    border: none;" | tee /home/vps/public_html/index.html
echo "color: white;    padding: 15px 32px;    text-align: center;    text-decoration: none;    display: inline-block;" | tee /home/vps/public_html/index.html
echo "font-size: 16px;" href="http://$IP:9091">Login Torrent Leech</a>" | tee /home/vps/public_html/index.html
echo "<a style="background-color: #008CBA;" | tee /home/vps/public_html/index.html
echo "border: none;  color: white;" | tee /home/vps/public_html/index.html
echo "padding: 15px 32px;    text-align: center;" | tee /home/vps/public_html/index.html
echo "text-decoration: none;    display: inline-block;" | tee /home/vps/public_html/index.html
echo "font-size: 16px;" href="download">Download File</a><br><br>" | tee /home/vps/public_html/index.html
echo "Powered by <a href="https://fawzya.net">Fawzya.Net</a>" | tee /home/vps/public_html/index.html
echo "</p></body></html>" | tee /home/vps/public_html/index.html



#Restart
service transmission-daemon restart
service httpd restart

#Finishing
echo "cat /root/log-install.txt" | tee /usr/bin/info
chmod +x /usr/bin/info
echo "Installasi Transmission-Daemon" | tee log-install.txt
echo "=================================" | tee log-install.txt
echo "Login Torrent Leech: http://$IP:9091" | tee log-install.txt
echo "Username: root" | tee log-install.txt
echo "Password: $pass" | tee log-install.txt
echo "--------------------" | tee log-install.txt
echo "Untuk file hasil leech silahkan download di http://$IP/download" | tee log-install.txt
