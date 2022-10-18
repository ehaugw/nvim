set encoding=utf-8
" let g:python3_host_prog = 'C:\Users\eivind.haug-warberg\AppData\Local\Programs\Python\Python36\python.exe' " windows only
let g:python3_host_prog="/usr/bin/python3"

" clear space function before setting to leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Remove newbie crutches in Command Mode
" cnoremap <Left> <Nop>
" cnoremap <Down> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" " Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" " Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


""""""""""""""""""""""""""""""""""""""""
"       NATIVE VIM CONFIGURATIONS      "
""""""""""""""""""""""""""""""""""""""""

" create a new variable field
autocmd FileType cs     map <leader>prop ccpublic float MyProperty { get; set; }<Esc>7b
" execute file as script
autocmd FileType python map <leader>ef :! python $(realpath %)<CR>
autocmd FileType lua    map <leader>ef :! lua5.1 %<CR>
autocmd FileType c      map <leader>ef :! if [ \! -f Makefile ]; then gcc % -o a.out && ./a.out && rm a.out; else make ccompileandexecute; fi<CR>

" SET leader to JK
inoremap <special> jk <ESC>
" CUSTOM VANILLA KEY BINDINGS
map <leader>fu a t(-_-t)<Esc>8h
" search in artsy files
map <leader>faa :! grep -r "artsy" -e ""<left>
map <leader>fah :! grep -r "./" -e ""<left>
" move cursor to top of screen
map <leader>j 20j20k
" wrap word in space
map <leader>fw i <Esc>2wi <Esc>
" break function call to new line
" map <leader>fl i<CR><Esc>$i<CR><Esc>kk$
map <leader>fl li<CR><Esc>k$%i<CR><Esc>kk$
" delete trailing
map <leader>dtw :%s/\s\+$//gce<CR>
" wrap all operators
map <leader>wao :%s/\([a-zA-Z0-9)]\+\)\(\)\([\*\/+\-=]\+\)\(\)\([(a-zA-Z0-9]\+\)/\1 \3 \5/gce<CR>
" delete swap files
map <leader>dab :! rm ~/.local/share/nvim/swap/*<CR>
" convert CamelCase to snake_case
map <leader>c2s :%s/\<\u\|\l\u/\= join(split(tolower(submatch(0)), '\zs'), '_')/gc

" move selection up
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"TAB AND INDENDATION
set expandtab                                                               " convert tab to spaces
set shiftwidth=4                                                            " << or >> moves 4 characters
set tabstop=4
set autoindent

"SEARCHING
set hlsearch ic

"AUTO COMPLETE
set wildmode=longest,list

"AUTO INCREMENT NUMBERS (increase: ctrl-a | decrease: ctrl-x)
:set nrformats+=alpha

"FORMATING
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/      " mark trailing white space as bad

"OTHER
set cursorline                                                              " will also highlight what you wrote last
autocmd FileType python let python_highlight_all = 1
syntax on

set showmatch                                                               " show matching paranthes
set number                                                                  " show line numbers
set cc=120                                                                  " show end of 80 characters
" set mouse=a                                                                 " enable mouse interactions in vim
" this requires win32yank
set clipboard=unnamedplus                                                   " yank to clipboard - doesn't work with block paste
syntax enable
set fileformat=unix

call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " general autocomplete and goto
    " Plug 'alec-gibson/nvim-tetris'                                          " tetris 
    Plug 'dominikduda/vim_current_word'                                     " underline all occurences of current word
    Plug 'vim-scripts/indentpython.vim'                                     " auto indentation
    Plug 'nvie/vim-flake8'                                                  " linting tool
    Plug 'jnurmine/Zenburn'                                                 " color scheme
    Plug 'altercation/vim-colors-solarized'                                 " color scheme
    " Plug 'morhetz/gruvbox'                                                  " color scheme 
    Plug 'preservim/nerdcommenter'                                          " comment keybindings
    Plug 'scrooloose/nerdtree'                                              " file tree browser
call plug#end()

" CONFIGURE FLAKE 8
" let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd FileType python map <leader>pep :call flake8#Flake8()<CR>
" END OF CONFIGURE FLAKE 8

" CONFIGURE PYDOCSTRING
let g:pydocstring_doq_path ='~/.local/bin/doq'                              " needed for py-docstring
map <leader>pd :Pydocstring<CR>
" END OF CONFIGURE PYDOCSTRING

" CONFIGURE NERD TREE
map <leader>q :NERDTreeVCS<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=60
" END OF CONFIGURE NERD TREE

" CONFIGURE PYTHON FUNCTION EXPANDER
let g:UltiSnipsUsePythonVersion = 3
nmap <leader>ya <Plug>(trimmer-mapping)
" END OF CONFIGURE PYTHON FUNCTION EXPANDER

" CONFIGURE DEOPLETE
let g:deoplete#enable_at_startup = 1
" END OF CONFIGURE DEOPLETE

" CONFIGURE NERDCOMMENTER
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

map <leader>kc :call nerdcommenter#Comment(0,"comment")<CR>
map <leader>ku :call nerdcommenter#Comment(0,"uncomment")<CR>
map <leader>kt :call nerdcommenter#Comment(0,"toggle")<CR>
" END OF CONFIGURE NERDCOMMENTER

" SET COLOR THEME USING ZENBURN OR SOLARIZED
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
    " colorscheme gruvbox
endif
" END OF SET COLOR THEME

" LET NERD TREE IGNORE .pyc
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" END OF LET NERD TREE IGNORE .pyc

" LOAD COC MODULES
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-pyright', 'coc-lua']

" SET COC KEYBINDINGS
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>n <Plug>(coc-references)
nmap <leader>le :<C-u>CocList diagnostics<cr>
autocmd FileType python set signcolumn=yes
autocmd FileType lua set signcolumn=yes
let g:coc_disable_startup_warning=1
" END OF SET COC KEYBINDINGS


" #################### READMEs ####################
"
" WIN32YANK
" 1) download zip and unzip it
" 2) $ sudo mv /tmp/win32yank.exe /usr/local/bin/
" 3) $ chmod +x /tmp/win32yank.exeank.exe
"
"
" INSTALL NEOVIM
" sudo apt-get update
" sudo apt-get upgrade
" sudo apt install neovim
" sudo apt install python3-pip
" sudo apt install python3.8-venv
" sudo apt install nodejs
" sudo apt install npm
" sudo npm install -g n
" sudo n stable
" pip3 install pynvim --upgrade
" pip3 install msgpack --upgrade
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

