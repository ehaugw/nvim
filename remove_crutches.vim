function! NoNoob() abort
    set mouse=
    inoremap <Esc> <Nop>
    inoremap <special> jk <ESC>
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
endfunction

function! Noob() abort
    set mouse=a
    inoremap <Esc> <Esc>
    " Remove newbie crutches in Insert Mode
    inoremap <Down> <Down>
    inoremap <Left> <Left>
    inoremap <Right> <Right>
    inoremap <Up> <Up>

    " Remove newbie crutches in Normal Mode
    nnoremap <Down> <Down>
    nnoremap <Left> <Left>
    nnoremap <Right> <Right>
    nnoremap <Up> <Up>

    " Remove newbie crutches in Visual Mode
    vnoremap <Down> <Down>
    vnoremap <Left> <Left>
    vnoremap <Right> <Right>
    vnoremap <Up> <Up>
endfunction

call NoNoob()
