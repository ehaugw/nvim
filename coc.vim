if exists('g:did_coc_loaded')
  finish
endif

" Point coc.nvim to the isolated Node
" let g:coc_node_path = '/home/eivind/.local/share/nvim/node-env/bin/node'

let g:coc_disable_startup_warning=1
let g:coc_global_extensions = ['coc-clangd', 'coc-sql', 'coc-omnisharp', 'coc-json', 'coc-tsserver', 'coc-pyright', 'coc-lua', 'coc-sh']

nmap <silent> gd <Plug>(coc-definition)
nmap <leader>n <Plug>(coc-references)
nmap <leader>le :<C-u>CocList diagnostics<cr>
nmap ]e :call CocAction('diagnosticNext')<cr>
nmap [e :call CocAction('diagnosticPrevious')<cr>
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#_select_confirm()

" USE K TO SHOW DOCUMENTATION USING COC WHEN POSSIBLE
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" END OF USE K TO SHOW DOCUMENTATION USING COC WHEN POSSIBLE
