"vim: set noexpandtab tabstop=2:
call pathogen#infect()

filetype plugin on
filetype indent on

" http://stackoverflow.com/questions/6467634/create-a-command-shortcut-for-nerdtree-in-vim-editor
nmap <leader>nt :NERDTree<cr>

"http://tim.theenchanter.com/2008/07/crontab-temp-file-must-be-edited-in.html
set backupskip=/tmp/*,/private/tmp/*" 

set hidden 
"set list

" http://superuser.com/questions/323712/modeline-not-work-in-vim
set modeline

"delete whole word
map dW daW
map dw daw

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" LanguageTool
let g:languagetool_jar="/Applications/LanguageTool-2.7/languagetool-commandline.jar"

"xml indent
"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
"let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax

" csv.vim comment
let g:csv_comment = '#'

" use docx2txt.pl to allow VIm to view the text content of a .docx file directly.
autocmd BufReadPre *.docx set ro
autocmd BufReadPost *.docx %!docx2txt.pl 

" zip.vim
let g:zipPlugin_ext= '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm,*.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'

" highlight spelling check in GUI
"hi SpellBad gui=NONE guibg=Red

" vim-pandoc
" let g:pantondoc_disabled_modules = ["folding"]
" let g:pandoc_use_conceal = 0
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#use=0

" Notmuch Addressbook manager for vim
" Bundle "guyzmo/notmuch-abook"

set timeout
set timeoutlen=500
set ttimeoutlen=50

" Vim-R-plugin
autocmd BufNewFile,BufRead *.R set conceallevel=0
autocmd BufNewFile,BufRead *.Rnw set conceallevel=0
" autocmd BufNewFile,BufRead *.Rmd set conceallevel=0

" ft-r-indent
let r_indent_align_args = 0

"LargeFile.vim
let g:LargeFile = 5

"set formatoptions-=ro 

"json indentation
"http://visibletrap.blogspot.com/2010/05/vim-how-to-format-and-syntax-highlight.html
"VIM - How to format and syntax highlight JSON file
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" scons
au BufNewFile,BufRead SCons* set filetype=scons 

" search program
set grepprg=findstr.py

" set make program
set makeprg=makepp\ -s

"R Plugin
"do not convert _ to <-
let g:vimrplugin_assign = 0

source ~/.vim/fortranrc.vim

"open file under cursor
"map <F8> :exe "below new ".expand("<cfile>")<CR>
map <F7> :exe "below new ".expand("<cfile>")<CR>
map <S-F7> :exe "new ".expand("<cfile>")<CR>

" My configurations
set nobackup
" set linebreak

" code style
"set equalprg=astyle 

" do not go to line start
set nostartofline

"set noexpandtab tabstop=2
set shiftwidth=2
set expandtab
set sts=2
set ts=2

"Set working directory to the current file
map ,cd :cd %:p:h<CR>

set incsearch "incremental search 

set sm "When a bracket is inserted, briefly jump to the matching one. 

set nu
"winpos 0 0
set bg=dark
highlight Normal guibg=Black guifg=White
syntax enable
set nohlsearch

" Like windo but restore the current window.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)

" Like bufdo but restore the current buffer.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)

command! WA Bufdo w!

" The value of this option influences when the last window will have a status line:
"    2: always
set laststatus=2

"filename completion with @
set isfname+=@-@

"for interprete .tex file as latex file
let g:tex_flavor='latex'

"Empty *.m files will automatically be presumed to be Matlab files unless you have the following in your .vimrc:
let filetype_m = "mma"

" match < and >
set matchpairs+=<:>

" gf search path
"set path=.,$DFM/**
"Note the trailing semicolon - it enables upwards-recursive search of tags file. For example, if your editing file src/dblayer/engine/query.c and press C-] for some function, VIM will search the tags file in the following order:
set tags=./tags;

" no bells wanted
set vb t_vb=
" must reset it again when the GUI starts
if has("gui")
  autocmd GUIEnter * set t_vb=
endif

set wildmode=longest:list

function ToggleHLSearch()
  if &hls
    set nohls
  else
    set hls
  endif
endfunction
nmap <silent> <C-n> :silent call ToggleHLSearch()<CR>

map <S-F4> <ESC>:wa<kEnter>:make o<kEnter>:cope<kEnter>
map <F4> <ESC>:w<kEnter>:make<kEnter>:cope<kEnter>
map <S-F6> <ESC>:!gnome-terminal &<kEnter>
map <F6> <ESC>:setlocal spell spelllang=en_us<kEnter>
"nnoremap <silent> <F7> :TlistToggle<CR>

"no space when joining
nnoremap gJ Jdiw

"fu! <SID>SwapWords(...) range
"    if len(a:000)!= 2
"        echomsg "SwapWords has to be called with 2 Arguments!"
"        return
"    elseif (search(a:1 ,'n') == 0 || search(a:2, 'n') == 0)
"        echomsg "not both args found"
"        return
"    endif
"
"    let pat=join(map(copy(a:000), '"\\%(" .v:val. "\\)"'), '\|')
"    :exe a:firstline . ',' . a:lastline . 's/'.pat. '/\=printf("%s",submatch(0)==a:1 ? a:2 : a:1 )/'
"endfu 
"com! -nargs=+ -range=% Swap :<line1>,<line2>call <SID>SwapWords(<f-args>) 

"vim session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
map <c-q> :mksession! ~/.vim/.session <cr>
map <c-s> :source ~/.vim/.session <cr>

"full file indent
fun BenIndent()
  let oldLine=line('.')
  normal gg=G
  execute ':' . oldLine
endfun
"map -- :call BenIndent()<Bar>normal zz<CR>
map -- :call BenIndent()<CR>

map p p
map gp gp
map P P`[
map gP gP`[
" My configurations

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" automatically load
set autoread

" do not notife swp file
augroup SwapClobber
  au!
  au SwapExists * let v:swapchoice='e'
augroup END

" From Bram:
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" DF - Also do not do this if the file resides in the $TEMP directory,
"      chances are it is a different file with the same name.
" This comes from the $VIMRUNTIME/vimrc_example.vim file 

" Suresh Govindachar,  September 24, 2004 19:57
" I have made a modification:  Do not open the fold in
" the special case of the cursor being on the edge of
" an increasing fold.  So, the fold will not be opened
" in the following two cases:
"
"  1) cursor is on line 1
"  2) cursor is on the edge of a fold and the
"     foldlevel of the previous line is smaller than
"     that of the current line.
" I also created an augroup. 
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |        
        \   endif |
        \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
augroup END 


" http://www.vim.org/scripts/script.php?script_id=3600
" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END 

"Tip 1554 Previous Next created April 18, 2008 · complexity intermediate · author Paluh · version 7.0
"
"These two functions allow you to move window between tabs. Unlike the :tabmove command, which moves an entire tab to a new position, these functions will move a window in the current tab into another existing tab (or a new tab if there are no other existing tabs).
"
"For example, assume you are editing files in three tabs: [1],[2],[3] – where [] indicates a tab page, and the list of numbers inside brackets shows the windows open in that tab (when there is more than one window in one tab, the script splits it horizontally).
"
"Assume that we are in the first tab (so we are editing window with buffer with file 1 – bold marks current window). After :call MoveToNextTab() there will be [1,2],[3]. After the next :call MoveToNextTab() the windows will be arranged thusly: [2][1,3]. And after next one: [2],[3],[1].
"
"Of course MoveToPrevTab() works in opposite direction. 

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap <A-.> :call MoveToNextTab()<CR>
nnoremap <A-,> :call MoveToPrevTab()<CR>

" Add a blank line below the cursor.
map <A-o> o<Up><Esc>  
" Add a blank line above the cursor.
map <A-O> O<Down><Esc> 

autocmd FileType r setlocal comments=b:#,b:##,b:###,b:#'
"vim-latex
let g:Tex_Menus = 0
let g:Tex_MathMenus = 0
"disable IMap
let g:Imap_FreezeImap = 1
"let g:Tex_SmartKeyQuote = 0

" http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" split line
nnoremap K i<Enter><Esc>
" " insert single character
nmap <Space> i_<Esc>r
nmap <leader>n :set nu!<CR>
nmap <leader>N :set relativenumber!<CR>

" keep several lines when scroll
set scrolloff=3

" turn off arrow buttons
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

set showcmd
nnoremap Q <nop>
nmap <leader>L :set cursorline!<CR>
