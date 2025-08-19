function! LoadPathAtCursor(...) abort
    " save original buffer
    let old_buffer = getreg("\"")

    " save original position
    let old_line = line(".")
    let old_col = col(".")

    " clean register
    call setreg("\"", "")

    " copy inside quotation marks
    execute "norm yi\""

    " return to original position
    call cursor(old_line, old_col)

    " if nothing was copied, copy the entire word at the cursor
    if empty(getreg("\""))
        execute "norm yiW"
        " ... and return cursor, once again
        call cursor(old_line, old_col)
    endif

    " split on comma
    for section in split(getreg("\""), "\W*,\W*")
        " split on non-word
        for word in split(section, "\W+")
            if a:0
                execute 'edit' fnameescape(systemlist('find . -name ' . word)[0])
            else
                execute "e " . word
            endif
        endfor
    endfor

    " insert original value into buffer
    call setreg("\"", old_buffer)
endfunction

:command! E :call LoadPathAtCursor()
:command! FE :call LoadPathAtCursor(1)
" :command! FE :norm yi" | :execute 'edit' fnameescape(systemlist('find src -name "run_interceptor.py"')[0])
