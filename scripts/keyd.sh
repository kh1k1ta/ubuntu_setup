git clone https://github.com/rvaiya/keyd
cd keyd
sudo make && sudo make install

sudo systemctl enable keyd
sudo systemctl start keyd

sudo keyd reload

cd ..
sudo rm -rf keyd
