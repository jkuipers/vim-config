call pathogen#infect()

set nocp bs=2 ru sc sm expandtab vi=\"100,'50,rA: ar wmnu ch=2 ls=2
set nobackup aw sw=4 ts=4 sta gd ww+=[,] shm+=I nojs so=1 mh
set listchars=tab:»·,trail:·,eol:$ smc=5000 go-=M
set dir=.,D:\Temp
set wildignore+=*.class,target,.git,.svn
" vim 7.3 persistent undo options:
set undodir=D:\data\jorisk\VimUndo undofile
" for Git:
"set statusline+=%{fugitive#statusline()}

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

map <F2> :NERDTreeToggle<CR>
map <F3> :CommandT<CR>
map <F5> :CommandTFlush<CR>
nnoremap <F4> :GundoToggle<CR>

imap <S-CR> <Esc>o
imap <C-S-CR> <Esc>O

" move lines like in Eclipse (depends on 'vim-unimpaired' plugin)
map  <M-Up>   [e
map  <M-Down> ]e
imap <M-Up>   <Esc>[ea
imap <M-Down> <Esc>]ea
vmap <M-Up>   [egv
vmap <M-Down> ]egv

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

com! CD lcd %:p:h

" for xml plugin:
"let xml_jump_string="``"

filetype plugin indent on
syntax on

autocmd BufReadPost *.xml set sw=2 ts=2 iskeyword+=-
"imap >> ><Esc>mx?<?e1<Cr>y/[[:space:]>]<Cr>`xa</<Esc>pa><Esc>F<i
autocmd BufReadPost pom.xml set noexpandtab

set diffexpr=MyDiff()
function MyDiff()
  let opt = ''
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  silent execute '!C:\Progra~2\Vim\vim73\diff -a ' . opt . '"' . v:fname_in . '" "' . v:fname_new . '" > "' . v:fname_out . '"'
endfunction

let java_allow_cpp_keywords = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:SuperTabDefaultCompletionType="context"
