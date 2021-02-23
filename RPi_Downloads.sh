#RPI_Downloads.sh
#Mohammed Emun
#Run this script to download node modules for 
#the Raspberry Pi

#Use "sudo bash RPi_Downloads.sh" to run this script in the terminal
clear;
echo "Starting Shell Script..";
echo "Cloning RaspberyPi-SpatialToolbox From Github";
sudo git clone "https://github.com/PTC-Academic-Advanced-Technologies/RaspberryPi-SpatialToolbox.git";
sudo apt-get update; 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -; 
sudo apt-get install -y nodejs; 
sudo apt-get -f install npm;
clear;
echo "Node Version:";
node --version;
echo "NPM Version:";
npm --version;
echo;
echo;
echo;
echo "Moving 'spatialToolbox' folder to Documents";
mv /home/pi/Desktop/RaspberryPi-SpatialToolbox/spatialToolbox /home/pi/Documents;
echo "Moved Folder";
echo "Doing npm installs";
cd /home/pi/Desktop/RaspberryPi-SpatialToolbox/vuforia-spatial-edge-server;
echo "npm installing in 'vuforia-spatial-edge-server' folder";
sudo npm install;
cd addons;
cd vuforia-spatial-core-addon;
echo "npm installing in addon folders";
sudo npm install; 
cd ..;
cd vuforia-spatial-basic-interfaces-addon;
sudo npm install;
cd ..;
cd vuforia-spatial-robotic-addon;
sudo npm install;
cd /home/pi/Desktop/RaspberryPi-SpatialToolbox/vuforia-spatial-edge-server;
sudo npm install;
cd /home/pi/;
clear;
echo;
echo;
echo;
echo;
echo;
echo "All Downloads Finished!";
echo "type in 'cd RaspberryPi-SpatialToolbox/vuforia-spatial-edge-server'";
echo "then do 'sudo chown -R $USER /home/pi'";
echo "After, you can run 'node server' to start the server!";