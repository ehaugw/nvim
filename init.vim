set encoding=utf-8
" let g:python3_host_prog = 'C:\Users\eivind.haug-warberg\AppData\Local\Programs\Python\Python36\python.exe' " windows only
let g:python3_host_prog="/usr/bin/python3"

inoremap <special> jk <ESC>
tnoremap <Esc> <C-\><C-n>

" rebind leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap ÅÅ :keeppatterns ?^\(def\s\S\|class\s\S\)<cr>
nnoremap åå :keeppatterns /^\(def\s\S\|class\s\S\)<cr>
nmap ø [
nmap æ ]
nmap Ø {
nmap Æ }

" Calculate highlighted text as math
vnoremap <leader>calc c<C-r>=<C-r>"<CR><Esc>
vnoremap <leader>equ c<C-r>" = <C-r>=<C-r>"<CR><Esc>


""""""""""""""""""""""""""""""""""""""""
"       NATIVE VIM CONFIGURATIONS      "
""""""""""""""""""""""""""""""""""""""""

" Align on = delimiter
nnoremap <leader>== :%! sed "s/ *= */=/g" \| column -t -s "=" -o " = "<cr>
vnoremap <leader>== :'<,'>! sed "s/ *= */=/g" \| column -t -s "=" -o " = "<cr>
nnoremap <leader>=d= :%! sed "s/ *= */=/g"<cr>
vnoremap <leader>=d= :'<,'>! sed "s/ *= */=/g"<cr>

" Align on \# delimiter
nnoremap <leader>=# :%! sed "s/ *\# */\#/g" \| column -t -s "\#" -o " \# "<cr>
vnoremap <leader>=# :'<,'>! sed "s/ *\# */\#/g" \| column -t -s "\#" -o " \# "<cr>
nnoremap <leader>=d\# :%! sed "s/ *\# */\#/g"<cr>
vnoremap <leader>=d\# :'<,'>! sed "s/ *\# */\#/g"<cr>

" Align on ; delimiter
nnoremap <leader>=; :%! sed "s/ *; */;/g" \| column -t -s ";" -o " ; "<cr>
vnoremap <leader>=; :'<,'>! sed "s/ *; */;/g" \| column -t -s ";" -o " ; "<cr>
nnoremap <leader>=d; :%! sed "s/ *; */;/g"<cr>
vnoremap <leader>=d; :'<,'>! sed "s/ *; */;/g"<cr>

" Align on | delimiter
nnoremap <leader>=\| :%! sed "s/ *\| */\|/g" \| column -t -s "\|" -o " \| "<cr>
vnoremap <leader>=\| :'<,'>! sed "s/ *\| */\|/g" \| column -t -s "\|" -o " \| "<cr>
nnoremap <leader>=d\| :%! sed "s/ *\| */\|/g"<cr>
vnoremap <leader>=d\| :'<,'>! sed "s/ *\| */\|/g"<cr>

" Align on : delimiter
nnoremap <leader>=: :%! sed "s/ *: */:/g" \| column -t -s ":" -o " : "<cr>
vnoremap <leader>=: :'<,'>! sed "s/ *: */:/g" \| column -t -s ":" -o " : "<cr>
nnoremap <leader>=d: :%! sed "s/ *: */:/g"<cr>
vnoremap <leader>=d: :'<,'>! sed "s/ *: */:/g"<cr>

" delete comment on same line
autocmd FileType python vnoremap <leader>kd :!sed "s/ *\\#[^\\#]*$//g"<cr>
autocmd FileType python nnoremap <leader>kd :!sed "s/ *\\#[^\\#]*$//g"<cr>

" create new terminal on bottom
:command TERM :below 20 sp term://bash
:command TTERM :tabnew term://bash

" Open rcs
:command VIMRC :e ~/.config/nvim/init.vim
:command VIMRCLOCAL :e ~/.config/nvim/init.vim.local
:command BASHRC :e ~/.bashrc
:command LOAD :source Session.vim
:command SAVE :NERDTreeVCS | q | mksession!
:command SAVEQ :mksession! | qa

:command Qa :qa
:command Q :q
:command W :w
:command Wq :wq

set splitright

set updatetime=100

" create a new variable field
autocmd FileType cs     map <leader>prop ccpublic float MyProperty { get; set; }<Esc>7b

" execute file as script
autocmd FileType python map <leader>ef :! if [ \! -f Makefile ]; then python $(realpath %); else make compileandexecute; fi<CR>
autocmd FileType lua    map <leader>ef :! if [ \! -f Makefile ]; then lua5.1 $(realpath %); else make compileandexecute; fi<CR>
autocmd FileType c      map <leader>ef :! if [ \! -f Makefile ]; then gcc % -o a.out && ./a.out && rm a.out; else make compileandexecute; fi<CR>
autocmd FileType cs     map <leader>ef :! if [ \! -f Makefile ]; then dotnet run; else make compileandexecute; fi<CR>

" create makefile for execute
autocmd FileType python map <leader>cef :! if [ \! -f Makefile ]; then echo $'compileandexecute:\n\tpython %' > Makefile; fi<CR>

" CUSTOM VANILLA KEY BINDINGS
function! Collapse() abort
    let startline = line(".")
    execute "norm %"
    " while line(".") == startline
    "     execute "norm J%"
    " endwhile
    while line(".") != startline
        execute "norm kJ"
    endwhile
    execute "norm %"
endfunction
:command COLLAPSE :call Collapse()
nnoremap <leader>col :COLLAPSE<cr>

:command! -range=% EXPAND :'<,'>!sed -r "s/\s*([][}{)(])/\1\n/g" | sed -r "s/([^\^]+)([][}{)(])/\1\n\2/g" | sed -r "s/,([^$])/,\n\1/g"
:command RELOAD :source $MYVIMRC 

nnoremap <leader>fu A t(-_-t)<Esc>8h
" search in artsy files
map <leader>fah :! grep -r "./" -e ""<left>

" FORMATTING KEYBINDIGNS
" wrap word in space
nnoremap <leader>fw lbi <Esc>2wi <Esc>
" break function call to new line
nnoremap <leader>fl %%a<CR><Esc>k$%i<CR><Esc>%
" delete trailing
nnoremap <leader>dtw :%s/\s\+$//gce<CR>
vnoremap <leader>dtw :s/\s\+$//g<cr>
" wrap all operators
map <leader>wao :%s/\([a-zA-Z0-9)]\+\)\(\)\([\*\/+\-=]\+\)\(\)\([(a-zA-Z0-9]\+\)/\1 \3 \5/gce<CR>
" delete swap files
:command DAB ! if [ -d ~/.local/share/nvim/swap ]; then rm ~/.local/share/nvim/swap/*; else rm ~/.local/state/nvim/swap/*; fi
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
set wildmode=full:lastused
set wildmenu

"AUTO INCREMENT NUMBERS (increase: ctrl-a | decrease: ctrl-x)
:set nrformats+=alpha

"FORMATING
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/      " mark trailing white space as bad

"OTHER
set cursorline                                                              " will also highlight what you wrote last
autocmd FileType python let python_highlight_all = 1
syntax on

set showmatch                                                               " show matching paranthes
set nu rnu                                                                  " show line numbers
set cc=120                                                                  " show end of 80 characters
" this requires win32yank
" set clipboard=unnamedplus                                                   " yank to clipboard - doesn't work with block paste
" requires alias to be set in bashrc
let g:clipboard = {
            \   'name': 'win32yank-wsl',
            \   'copy': {
            \      '+': 'win32yank -i --crlf',
            \      '*': 'win32yank -i --crlf',
            \    },
            \   'paste': {
            \      '+': 'win32yank -o --lf',
            \      '*': 'win32yank -o --lf',
            \   },
            \   'cache_enabled': 0,
            \ }


syntax enable
set fileformat=unix

call plug#begin()
    Plug 'epwalsh/obsidian.nvim'                                            " navigate obisidan vaults
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
    Plug 'airblade/vim-gitgutter'                                           " integrate git into nvim
    " Plug 'dosimple/workspace.vim'                                           " buffer list internal to tabs
    " Plug 'vim-ctrlspace/vim-ctrlspace'                                      " buffer list internal to tabs
    Plug 'ehaugw/BoundBuffers'                                              " better buffer management
    Plug 'ehaugw/RemoveCrutches'                                            " better buffer management
call plug#end()

" CONFIGURE GITGUTTER
" [c previous hunk
" ]c next hunk
" <leader>hu undo hunk
" <leader>hp preview hunk
" <leader>hs stage hunk
set signcolumn=yes
" END OF CONFIGURE GITGUTTER

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
:command NT   :NERDTreeVCS<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=44
" END OF CONFIGURE NERD TREE

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
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1
    highlight clear SignColumn
    " colorscheme gruvbox
endif
" END OF SET COLOR THEME

" LET NERD TREE IGNORE .pyc
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" END OF LET NERD TREE IGNORE .pyc

" LOAD COC MODULES
let g:coc_global_extensions = ['coc-sql', 'coc-omnisharp', 'coc-json', 'coc-tsserver', 'coc-pyright', 'coc-lua', 'coc-sh']

" SET COC KEYBINDINGS
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>n <Plug>(coc-references)
nmap <leader>le :<C-u>CocList diagnostics<cr>
nmap <leader>rn <Plug>(coc-rename)
" USE K TO SHOW DOCUMENTATION USING COC WHEN POSSIBLE
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" END OF USE K TO SHOW DOCUMENTATION USING COC WHEN POSSIBLE

autocmd FileType python set signcolumn=yes
autocmd FileType lua set signcolumn=yes
let g:coc_disable_startup_warning=1

inoremap <silent><expr> <c-space> coc#_select_confirm()

let localvimfile = expand($MYVIMRC) . '.local'
if filereadable(localvimfile)
    exec "source " . localvimfile
endif
autocmd BufEnter *.vim.local :setlocal filetype=vim

