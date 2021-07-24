apt install figlet
apt install lolcat
pip3 install -r requirements.txt
pip install -r requirements.txt
cd $HOME
git clone https://github.com/xero/figlet-fonts.git
cd figlet-fonts
sudo cp -rf * /usr/share/figlet/
cd $HOME
chmod -R 755 Tbomb/
cd Tbomb/
./TBomb.sh
cp -rf tbomb.sh /usr/bin/tbomb.sh
cp -rf tbomb.sh /usr/bin/Tbomb.sh
echo '''**************************************************************************'''
echo '''**  Now You Can Run Tbomb From Anywhere By Typing tbomb.sh or Tbomb.sh  **'''
echo '''**************************************************************************'''
