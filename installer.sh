# # VSCode
# Add the repo
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
# Install the package
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

# # FastFetch
# Add the repo
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
# Install the package
sudo apt install fastfetch

# # Docker

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -i
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# start the Docker service
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Test the installation
sudo docker run hello-world

# # Docker Desktop
# Download the .deb file
wget 'https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64' \
    --output-document=docker-desktop-amd64.deb
# Install the package
sudo apt install ./docker-desktop-amd64.deb
rm
# Note: At the end of the installation process, apt displays an error due to installing a downloaded package. You can ignore this error message
# N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
