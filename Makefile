all:
	sudo apt install curl -y
	sudo add-apt-repository ppa:deadsnakes/ppa -y
	sudo apt-add-repository ppa:neovim-ppa/unstable -y
	sudo apt-get update -y
	# if this fails
	# confirm that you are using WSL1
	# https://askubuntu.com/questions/1402336/apt-trying-to-fetch-versions-not-available-in-archive-ubuntu-com-ubuntu-pool-mai
	#
	sudo apt-get upgrade -y
	# if this fails
	# https://askubuntu.com/questions/1305141/failed-to-fetch-security-undetermined-error-ip-91-189-91-38-80-in-ubuntu-20-0
	#
	sudo apt install neovim -y
	sudo apt install python3-pip -y
	sudo apt install python3.10-venv -y
	if ! [ -d /mnt/c/Users/eha ]; then \
		sudo apt install nodejs -y; \
		sudo apt install npm -y; \
		sudo npm install -g n; \
		sudo n stable; \
	fi
	pip3 install pynvim --upgrade
	pip3 install msgpack --upgrade
	if [ ! -e "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]; then curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; fi
	git config --global user.email "warberg@cdds.ai"; \
	git config --global user.name "Eivind Haug-Warberg"
	git config --global core.editor nvim
	# nvim -c 'PlugInstall'
	nvim --headless +PlugInstall +qa

gnome:
	# copy config files from here to computer
	cp home_configs/.bashrc_personal ~/.bashrc_personal
	cp home_configs/.tmux.conf ~/.tmux.conf
	cp home_configs/.ssh/config ~/.ssh/config
	# Remap Caps Lock to Control
	setxkbmap -option ctrl:nocaps
	gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
	# set the nvim repo to use a secondary key, to free up the primary key for work purposes
	git remote set-url origin git@github-ehaugw:ehaugw/nvim.git
	echo "remember to rename your current id_rsa to id_rsa_ehaugw"
	# hide dock
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
	gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true


win32yank:
	curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
	unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
	chmod +x /tmp/win32yank.exe
	if [ -d /mnt/c/Users/eivind.haug-warberg ]; then \
		mkdir -p /mnt/c/Users/eivind.haug-warberg/Wsl; \
		mv /tmp/win32yank.exe /mnt/c/Users/eivind.haug-warberg/Wsl/; \
		sudo ln -s -f /mnt/c/Users/eivind.haug-warberg/Wsl/win32yank.exe /usr/local/bin/win32yank ; \
	fi
	if [ -d /mnt/c/Users/eivind ]; then \
		sudo mv /tmp/win32yank.exe /usr/local/bin/win32yank ; \
	fi
	if [ -d /mnt/c/Users/ehaugw ]; then \
		mkdir -p /mnt/c/Users/ehaugw/Wsl; \
		mv /tmp/win32yank.exe /mnt/c/Users/ehaugw/Wsl/; \
		sudo ln -s -f /mnt/c/Users/ehaugw/Wsl/win32yank.exe /usr/local/bin/win32yank ; \
	fi
	if [ -d /mnt/c/Users/ehaug ]; then \
		mkdir -p /mnt/c/Users/ehaug/Wsl; \
		mv /tmp/win32yank.exe /mnt/c/Users/ehaug/Wsl/; \
		sudo ln -s -f /mnt/c/Users/ehaug/Wsl/win32yank.exe /usr/local/bin/win32yank ; \
	fi
	if [ -d /mnt/c/Users/eha ]; then \
		mkdir -p /mnt/c/Users/eha/Wsl; \
		mv /tmp/win32yank.exe /mnt/c/Users/eha/Wsl/; \
		sudo ln -s -f /mnt/c/Users/eha/Wsl/win32yank.exe /usr/local/bin/win32yank ; \
	fi
