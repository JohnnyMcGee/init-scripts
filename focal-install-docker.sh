echo "[-] Removing old versions of docker..."
apt-get remove docker docker-engine docker.io containerd runc
echo "done"
echo "[+] Installing Docker for Ubuntu from repository"
echo "    - Installing dependencies"
apt update && apt install -y ca-certificates curl gnupg lsb-release
echo "    - Adding docker gpg key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "    - Installing docker stable release..."
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "done"
echo "[+] Starting docker service"
service docker start
echo "done"