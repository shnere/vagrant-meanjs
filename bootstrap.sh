echo "========================="
echo "Provisioning VM..."
echo "========================="

cd /home/vagrant

sudo apt-get update
sudp apt-get install -y curl

echo "Installing mongodb..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

echo "Adding node.js repository..."
curl -sL https://deb.nodesource.com/setup | sudo bash -

echo "Installing apps..."
sudo apt-get install -y unzip bash nodejs git
sudo npm install -g npm grunt-cli

echo "Installing Oh My Zsh..."
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "Installing Yeoman & generator..."
sudo npm install -g yo generator-meanjs

echo "========================="
echo "Provisioning finished"
echo "========================="
