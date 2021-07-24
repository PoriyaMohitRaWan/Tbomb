#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else 
            distro="invalid"
        fi
    fi
}

pause() {
    read -n1 -r -p "Press any key to continue..." key
}
banner() {
    clear
    echo -e "\e[1;31m"
    echo ""
    figlet -f 3d " Tbomb"
    echo " "
    echo -e "\e[31m NOTE: Kindly move to the PIP version Of TBomb for more stability.\e[0m"
    echo " "
}

init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}

install_deps(){
    
    packages=(openssl git $PYTHON $PYTHON-pip figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        $PIP install -r requirements.txt
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute bomber.py ."
        exit
    fi
}

banner
pause
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By ????? > .update
    echo 'Requirements Installed....'
    pause
fi
while :
do
    banner
    echo -e "\e[31m Please Read Instruction Carefully !!! \e[0m"
    echo " "
    echo "Press 1 To Start Bomber "
    sleep 0.1
    echo "Press 2 To Update (Works On Linux And Linux Emulators) "
    sleep 0.1
    echo "Press 3 To Exit"
    sleep 0.1
    echo ""
    read ""ch
    clear
    if [ $ch -eq 1 ];then
        ./loading.sh
        cd $HOME
        cd Tbomb
        python3 bomber.py
        exit
    elif [ $ch -eq 2 ];then
        echo -e "\e[1;34m Downloading Latest Files..."
        cd $HOME
        rm -rf Tbomb
        git clone https://github.com/PoriyaMohitRaWan/Tbomb.git
        cd Tbomb
	chmod +x TBomb.sh
        bash TBomb.sh
        exit
    elif [ $ch -eq 3 ];then
        echo ""
	figlet -f 3d " Tbomb"
	echo ""        
	exit
    else
        echo -e "\e[4;32m Invalid Input !!! \e[0m"
        pause
    fi
done
