all:
	sudo apt-get update
	# if this fails
	# https://askubuntu.com/questions/1402336/apt-trying-to-fetch-versions-not-available-in-archive-ubuntu-com-ubuntu-pool-mai
	
	sudo apt-get upgrade
	# if this fails
	# https://askubuntu.com/questions/1305141/failed-to-fetch-security-undetermined-error-ip-91-189-91-38-80-in-ubuntu-20-0
	
	sudo apt install neovim
	sudo apt install python3-pip
	sudo apt install python3.8-venv
	sudo apt install nodejs
	sudo npm install -g n
	sudo n stable
	pip3 install pynvim --upgrade
	pip3 install msgpack --upgrade
	if [ ! -e "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]; then curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; fi
	git config --global core.email "ehaugw@gmail.com"
	git config --global core.name "Eivind Haug-Warberg"
	git config --global core.editor nvim
