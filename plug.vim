call plug#begin()
    Plug 'vim-scripts/indentpython.vim'                                     " auto indentation
    Plug 'epwalsh/obsidian.nvim'                                            " navigate obisidan vaults
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " general autocomplete and goto
    Plug 'dominikduda/vim_current_word'                                     " underline all occurences of current word
    Plug 'nvie/vim-flake8'                                                  " linting tool
    Plug 'jnurmine/Zenburn'                                                 " color scheme
    Plug 'preservim/nerdcommenter'                                          " comment keybindings
    Plug 'scrooloose/nerdtree'                                              " file tree browser
    Plug 'airblade/vim-gitgutter'                                           " integrate git into nvim
    Plug 'ehaugw/BoundBuffers'                                              " better buffer management
call plug#end()
