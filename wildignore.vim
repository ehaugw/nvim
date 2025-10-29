let g:hasgit=!empty(glob('.git'))

if g:hasgit
    :set wildignore+=install/**
    :set wildignore+=share/**
endif
