function! AlignComments(...) range
    let commentsign = "#"
    if a:0 > 0
        let commentsign = a:1
    endif

    " remove indent
    '<,'>!sed "s/ *\#/\#/g"
    " '<,'>!sed "s/ *\# */\# /g"

    " measure indent
    let highest_indent = 0
    let old_line = -1
    let old_col = -1
    call cursor(a:firstline, 1)
    while search(commentsign, 'c', a:lastline) > 0 && (old_line < line(".") || old_col < col("."))
        let highest_indent = max([col("."), highest_indent])
        let old_line = line(".")
        let old_col = col(".")
        norm w
    endwhile

    " apply indent
    let highest_indent = highest_indent + 2
    let old_line = -1
    let old_col = -1
    call cursor(a:firstline, 1)
    while search(commentsign, 'c', a:lastline) > 0 && (old_line < line(".") || old_col < col("."))
        if col(".") < highest_indent
            execute "norm " . (highest_indent - col(".")) . "i "
        endif
        let old_line = line(".")
        let old_col = col(".")
        norm +
    endwhile

    " reindent single line comments
    call cursor(a:firstline, 1)
    let old_line = -1
    let old_col = -1
    while search("^\\s*" . commentsign, 'c', a:lastline) > 0 && (old_line < line(".") || old_col < col("."))
        norm ==
        let old_line = line(".")
        let old_col = col(".")
        norm +
    endwhile

    call cursor(a:firstline, 1)
endfunction

" :command! -range=% FORM :'<,'>! sed "s/ *,/,/g" | sed "s/,  */, /g" | sed "s/, \#/,  \#/g" | call AlignComments()
vnoremap <leader>ka :call AlignComments()<cr>
