" make ø and æ act as the corresponding keys on an american keyboard
nmap ø [
nmap æ ]
nmap Ø {
nmap Æ }

vmap ø [
vmap æ ]
vmap Ø {
vmap Æ }

" easier  []{} in insert mode
function! NoNor() abort
    imap ø [
    imap æ ]
    imap Ø {
    imap Æ }
endfunction

function! Nor() abort
    imap ø ø
    imap æ æ
    imap Ø Ø
    imap Æ Æ
endfunction
call NoNor()
