:command! LOAD :source Session.vim
:command! SAVE :NERDTreeClose | mksession!
:command! SAVEQ :NERDTreeClose | mksession! | qa
:command! BSAVE :call SaveSessionBranched()
:command! BSAVEQ :call SaveSessionBranched() | qa
:command! BLOAD :call LoadSessionBranched()

function! SaveSessionBranched(...) abort
    try
        let branch = trim(system('git branch --show-current | sed "s/[^a-zA-Z0-9_]//g"'))
        let file_name = 'vimsessions/Session_' . branch . '.vim'
    catch
        let file_name = 'Session.vim'
    endtry
    execute "mksession! " . file_name
endfunction

function! LoadSessionBranched(...) abort
    try
        let branch = trim(system('git branch --show-current | sed "s/[^a-zA-Z0-9_]//g"'))
        let file_name = 'vimsessions/Session_' . branch . '.vim'
    catch
        let file_name = 'Session.vim'
    endtry
    execute "source " . file_name
endfunction
