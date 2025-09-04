"a b c"
function! SplitAndLoadPathsAtCursor(...) abort
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

    call SplitAndLoadPaths(getreg("\""), a:0)

    " insert original value into buffer
    call setreg("\"", old_buffer)
endfunction

function! SplitAndLoadPaths(paths, ...) abort
    " split on comma
    for section in split(a:paths, '\s*,\s*')
        " split on non-word
        for word in split(section, '\s\+')
            if a:1
                for filehit in systemlist('find . -name ' . word)
                    execute 'edit' fnameescape(filehit)
                    echo fnameescape(filehit)
                endfor
            else
                execute "e " . word
                echo word
            endif
        endfor
    endfor
endfunction

:command! E :call SplitAndLoadPathsAtCursor()
:command! FE :call SplitAndLoadPathsAtCursor(1)
" :command! FE :norm yi" | :execute 'edit' fnameescape(systemlist('find src -name "run_interceptor.py"')[0])
