:command! LOAD :source Session.vim
:command! SAVE :NERDTreeClose | mksession!
:command! SAVEQ :NERDTreeClose | mksession! | qa
:command! BSAVE :call SaveSessionBranched()
:command! BSAVEQ :call SaveSessionBranched() | qa
:command! BLOAD :call LoadSessionBranched()

function! GetGitRoot(...) abort
    let git_root = system('git rev-parse --show-toplevel')
    let git_root = substitute(git_root, "\n$", "", "") " Remove trailing newline
    return git_root
endfunction

function! SaveSessionBranched(...) abort
    try
        let branch = trim(system('git branch --show-current | sed "s/[^a-zA-Z0-9_]//g"'))
        let file_name = GetGitRoot() . '/vimsessions/Session_' . branch . '.vim'
    catch
        let file_name = 'Session.vim'
    endtry
    execute "mksession! " . file_name

    " Compatability with mounted docker dirs
    let git_root = substitute(GetGitRoot(), expand('~/'), "~/", "g")
    " silent: execute "!sed -i \"s|cd " . git_root . "|execute 'cd ' . GetGitRoot()|g\" " . file_name
    silent: execute "!sed -i \"s|cd " . git_root . "||g\" " . file_name
    " silent: execute "!sed -i \"s|" . git_root . "||g\" " . file_name
endfunction

function! LoadSessionBranched(...) abort
    try
        let branch = trim(system('git branch --show-current | sed "s/[^a-zA-Z0-9_]//g"'))
        let file_name = GetGitRoot() . '/vimsessions/Session_' . branch . '.vim'
    catch
        let file_name = 'Session.vim'
    endtry
    execute "source " . file_name
endfunction

function! EditSessionBranched(...) abort
    try
        let branch = trim(system('git branch --show-current | sed "s/[^a-zA-Z0-9_]//g"'))
        let file_name = GetGitRoot() . '/vimsessions/Session_' . branch . '.vim'
    catch
        let file_name = 'Session.vim'
    endtry
    execute "e " . file_name
endfunction
