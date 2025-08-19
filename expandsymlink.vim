:command! RESOLVE :execute 'file ' . fnamemodify(resolve(expand('%:p')), ':.')

" " Commented out because it breaks find references, go to definition, and so on
" " Auto-resolve symlinks to relative paths
" function! s:ResolveSymlink()
"   if &buftype == ''
"     let l:real = resolve(expand('%:p'))
"     if l:real !=# ''
"       let l:relative = fnamemodify(l:real, ':.')
"       if l:relative !=# expand('%')
"         execute 'file ' . fnameescape(l:relative)
"       endif
"     endif
"   endif
" endfunction

function! SymlinkResolvedPath()
    if !isdirectory(expand('%:p:h')) || expand('%') == ''
        return ''
    endif
    let l:real = resolve(expand('%:p'))
    if l:real !=# expand('%:p')
        return fnamemodify(l:real, ':.') . ' (symlink)'
    endif
    return expand('%:p')
endfunction

set statusline=%{SymlinkResolvedPath()}
