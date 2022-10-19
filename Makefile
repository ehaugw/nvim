all:
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt install neovim
	sudo apt install python3-pip
	sudo apt install python3.8-venv
	sudo apt install nodejs
	sudo npm install -g n
	sudo n stable
	pip3 install pynvim --upgrade
	pip3 install msgpack --upgrade
	if [ ! -e "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]; then curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; fi
