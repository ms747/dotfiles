set list

" Rust compile
" nnoremap <leader>b :Cargo run --quiet<CR>
nnoremap <leader>b :Dispatch cargo build<CR>

" autocmd BufWritePost *.rs :Dispatch cargo check

" Rust Fmt
let g:rustfmt_autosave = 1

" Diagnostic
nmap <silent> <Leader>c :CocDiagnostics<CR>
nmap <silent> ]c :call CocAction('diagnosticNext')<cr>
nmap <silent> [c :call CocAction('diagnosticPrevious')<cr>

" Make
set makeprg=cargo\ run
nmap <silent> <Leader><Leader> :make<cr>
