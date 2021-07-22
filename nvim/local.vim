""
"" 個別にファイルを分割する程の行数でもない環境依存設定
""

" previm
augroup PrevimSetting
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" vimsay
let g:vimsay_cowpath = "/usr/share/clangsay/cows"
