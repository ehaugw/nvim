function! LoadPathAtCursor(...) abort
    let old_line = line(".")
    let old_col = col(".")
    call setreg("\"", "")

    execute "norm yi\""
    call cursor(old_line, old_col)

    if !empty(getreg("\"")) && stridx(getreg("\""), " ") == -1
        execute "e " . getreg("\"")
        return
    endif

    execute "norm yiW"
    call cursor(old_line, old_col)
    execute "e " . trim(getreg("\""), ",")
endfunction

:command! E :call LoadPathAtCursor()
