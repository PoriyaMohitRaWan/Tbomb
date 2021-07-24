cd
apt update&&apt upgrade
apt update&&apt upgrade
apt install figlet
apt install toilet
pip3 install -r requirements.txt
pip install -r requiremets.txt
git clone https://github.com/xero/figlet-fonts.git
cd figlet-fonts
cp -rf * ../../usr/share/figlet/
cd ..
chmod -R 755 Tbomb/
cd Tbomb/
./TBomb.sh
cp -rf tbomb.sh ../../usr/bin/tbomb.sh
cp -rf tbomb.sh ../../usr/bin/Tbomb.sh
echo '''*************************************************************'''
echo '''**  Now You Can Run Tbomb By Simply Typing tbomb or Tbomb  **'''
echo '''*************************************************************'''
