augroup filetypedetect
    au BufRead,BufNewFile Makefile setfiletype make
augroup END

augroup filetypedetect
    au BufRead,BufNewFile *.md setfiletype markdown
augroup END
