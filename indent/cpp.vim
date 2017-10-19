" Vim indent file
" Language:	C++
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2008 Nov 29

" Orginal CPP.vim

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" C++ indenting is built-in, thus this is very simple
setlocal cindent

let b:undo_indent = "setl cin<"

" Customize configure

" Fix C++ indentation for template
" http://stackoverflow.com/questions/28217118/vim-indents-c-c-functions-badly-when-the-type-and-name-are-in-different-lines
set cinoptions+=t0
