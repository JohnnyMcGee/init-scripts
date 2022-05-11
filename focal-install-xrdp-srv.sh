apt update
apt install -y xubuntu-desktop
apt install -y xrdp
service xrdp status
adduser xrdp ssl-cert
service xrdp stop
service xrdp start