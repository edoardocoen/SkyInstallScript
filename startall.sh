#!/bin/bash
 
##### ASK ROOT PASSWORD FOR ORANGEPI BOARDS (must be identical on all board to autoinstall board 2-8 using ssh)
echo "In order to install the OrangePI boards 2-8 automatically, we need to login via SSH to run the install routine. Please make sure the root password is the same on all boards!"
# read password twice
read -sp "Please enter root password: " RootPassword
echo
read -sp "Please enter root password (again): " RootPassword2

# check if passwords match and if not ask again
while [ "$RootPassword" != "$RootPassword2" ];
do
    echo 
    echo "Passwords do not match! Please try again."
    read -sp "Password: " RootPassword
    echo
    read -sp "Password (again): " RootPassword2
done
##### This must be there so terminal creates a new line after password entry!!!
echo
 
###### Install sshpass in order to login to OrangePI boards 2-8 using ssh
sudo apt-get install sshpass

##### Create a file where the trusted list of SSH keys will be stored
sudo mkdir ~/.ssh/
sudo touch ~/.ssh/known_hosts

###### Scan and add keys to trusted list
ssh-keyscan -H 192.168.0.108 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.109 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.110 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.111 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.112 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.113 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.114 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.115 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.116 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.117 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.118 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.119 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.120 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.121 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.122 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.123 >> ~/.ssh/known_hosts

###### In order to automatically install OrangePI 2-8 we need to login via SSH and run the SkyInstallScript...
###### ... for secondory boards.
###### Connect to OrangePI 2 and run installation
sshpass -p $RootPassword ssh root@192.168.0.108 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 3 and run installation
sshpass -p $RootPassword ssh root@192.168.0.109 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 4 and run installation
sshpass -p $RootPassword ssh root@192.168.0.110 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 5 and run installation
sshpass -p $RootPassword ssh root@192.168.0.111 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 6 and run installation
sshpass -p $RootPassword ssh root@192.168.0.112 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 7 and run installation
sshpass -p $RootPassword ssh root@192.168.0.113 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 8 and run installation
sshpass -p $RootPassword ssh root@192.168.0.114 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF
###### Connect to OrangePI 9 and run installation
sshpass -p $RootPassword ssh root@192.168.0.115 << EOF
sudo chmod 755 ~/startsecond.sh;
sudo sh ~/startsecond.sh; && exit
EOF

###### Clear root password variable
unset $RootPassword
