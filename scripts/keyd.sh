git clone https://github.com/rvaiya/keyd
cd keyd
sudo make && sudo make install

clear
sudo systemctl enable keyd
sudo systemctl start keyd

clear
cd ..
cp -r ./imports/keyd /home/rei/setting/
sudo rm -r /etc/keyd
sudo ln -s /home/rei/setting/keyd /etc/keyd

clear
sudo keyd reload
sudo rm -rf keyd
