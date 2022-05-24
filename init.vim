set encoding=utf-8
" let g:python3_host_prog = 'C:\Users\eivind.haug-warberg\AppData\Local\Programs\Python\Python36\python.exe' " windows only
let g:python3_host_prog="/usr/bin/python3"


""""""""""""""""""""""""""""""""""""""""
"       NATIVE VIM CONFIGURATIONS      "
""""""""""""""""""""""""""""""""""""""""

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

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" create a new variable field
autocmd FileType cs     map <leader>prop ccpublic float MyProperty { get; set; }<Esc>7b
" execute file as script
autocmd FileType python map <leader>ef :! python $(realpath %)<CR>
autocmd FileType lua    map <leader>ef :! lua5.1 %<CR>
autocmd FileType c      map <leader>ef :! gcc -o tmpexec %; ./tmpexec ; rm tmpexec<CR>
" SET leader to JK
inoremap <special> jk <ESC>
" CUSTOM VANILLA KEY BINDINGS
map <leader>fu a t(-_-t)<Esc>8h
" search in artsy files
map <leader>faa :! grep -r "artsy" -e ""<left>
" search in local folder
map <leader>fa :! grep -r "./" -e ""<left>
" move cursor to top of screen
map <leader>j 20j20k
" wrap word in space
map <leader>fw i <Esc>2wi <Esc>
" break function call to new line
" map <leader>fl i<CR><Esc>$i<CR><Esc>kk$
map <leader>fl li<CR><Esc>k$%i<CR><Esc>kk$
" auto indent line
map <leader>fi kJi<CR><Esc>
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
autocmd FileType cs let g:OmniSharp_highlight_types = 2
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
    Plug 'OmniSharp/omnisharp-vim'                                          " C# ide like behaviour
    " Plug 'alec-gibson/nvim-tetris'                                          " tetris 
    Plug 'vim-python/python-syntax'                                         " unknown
    Plug 'dominikduda/vim_current_word'                                     " underline all occurences of current word
    Plug 'VundleVim/Vundle.vim'                                             " vundle package handler
    Plug 'vim-scripts/indentpython.vim'                                     " auto indentation
    Plug 'nvie/vim-flake8'                                                  " linting tool
    Plug 'jnurmine/Zenburn'                                                 " color scheme
    Plug 'altercation/vim-colors-solarized'                                 " color scheme
    " Plug 'morhetz/gruvbox'                                                  " color scheme 
    Plug 'preservim/nerdcommenter'                                          " comment keybindings
    Plug 'scrooloose/nerdtree'                                              " file tree browser
    " Plug 'ColinKennedy/vim-python-function-expander'                        " unknown   - long load time
    " deoplete is an async jedi
        if has('nvim')
          Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " auto complete
        else
          Plug 'Shougo/deoplete.nvim'                                       " auto complete
          Plug 'roxma/nvim-yarp'                                            " auto complete
          Plug 'roxma/vim-hug-neovim-rpc'
        endif
    " end of deoplete is an async jedi
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }   " autogen docstring
call plug#end()

" CONFIGURE FLAKE 8
" let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd FileType python map <leader>pep :call flake8#Flake8()<CR>
" END OF CONFIGURE FLAKE 8

" CONFIGURE PYDOCSTRING
" let g:pydocstring_doq_path ='~/.local/bin/doq'                              " needed for py-docstring
" map <leader>pd :Pydocstring<CR>
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

" VUMBLE IMPORTS
set nocompatible
filetype off
set rtp+=~/.config/nvim/vundle/Vundle.vim
call vundle#begin()
    " Bundle 'jistr/vim-nerdtree-tabs'                  " name tabs with proper name rather than nerd_tree_1
" call vundle#begin('C:\Users\eivind.haug-warberg\AppData\Local\nvim\vundle')
    Bundle 'VundleVim/Vundle.vim'
"   Bundle 'Valloric/YouCompleteMe'
    Plugin 'davidhalter/jedi-vim'                       " goto functionality, also used for autocomplete
    " Bundle 'jistr/vim-nerdtree-tabs'                  " I use another nerd tree tabs
call vundle#end()
filetype plugin indent on
" VUMBLE IMPORTS END

" LET NERD TREE IGNORE .pyc
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" END OF LET NERD TREE IGNORE .pyc

" SET JEDI KEYBINDINGS
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "<F12>"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_enabled = 0                      " turn off jedi autocomplete and rather use deoplete
let g:jedi#use_tabs_not_buffers = 1
" END OF SET JEDI KEYBINDINGS

" SET OMNISHARP KEYBINDINGS
autocmd FileType cs nnoremap <leader>d :OmniSharpGotoDefinition tabedit<CR>
autocmd FileType cs nnoremap <leader>pd :OmniSharpPreviewDefinition<CR>
autocmd FileType cs nnoremap <leader>n :OmniSharpFindUsages<CR>
" OmniSharpDocumentation to show documentation
" END OF SET OMNISHARP KEYBINDINGS

" #################### READMEs ####################
"
" WIN32YANK
" 1) download zip and unzip it
" 2) $ sudo mv /tmp/win32yank.exe /usr/local/bin/
" 3) $ chmod +x /tmp/win32yank.exeank.exe
