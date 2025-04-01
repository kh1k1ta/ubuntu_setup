git clone https://github.com/rvaiya/keyd
cd keyd
sudo make && sudo make install
sudo systemctl enable keyd
sudo systemctl start keyd
cd ..
sudo cp ./imports/default.conf /etc/keyd/default.conf
sudo keyd reload

