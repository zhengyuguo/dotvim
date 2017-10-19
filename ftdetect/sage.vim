augroup filetypedetect
  au! BufRead,BufNewFile *.sage setfiletype python
  au! BufRead,BufNewFile *.spyx setfiletype cython
augroup END
