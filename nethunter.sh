#!/bin/sh
clear
echo Installing depends...
apt install figlet -y
apt install tar -y
apt install proot -y
apt install wget -y
clear
figlet Termux NetHunter
echo By The BACKTRACK
echo Downloading Rootfs...
wget build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-minimal.tar.xz
echo Decompressing Rootfs... You can ignore mknod errors
tar xJf kalifs-arm64-minimal.tar.xz
rm -rf kalifs-arm64-minimal.tar.xz
echo Configuring NetHunter...
touch start-nh.sh
chmod +x start-nh.sh
echo "#!/bin/sh" >> ~/start-nh.sh
echo "unset LD_PRELOAD" >> ~/start-nh.sh
echo "proot -r ./kali-arm64 -0 -w / -b /dev -b /proc -b /sys /bin/bash --login" >> ~/start-nh.sh
echo You can now launch NetHunter using ./start-nh.sh
