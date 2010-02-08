set nocp bs=2 ru sc sm expandtab vi=\"100,'50,rA: ar wmnu ch=2 ls=2
set nobackup aw sw=4 ts=4 sta gd ww+=[,] shm+=I fdc=5 nojs so=1 mh
set listchars=tab:»·,trail:·,eol:$ smc=5000

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

imap <S-CR> <Esc>o
imap <C-S-CR> <Esc>O

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

com! CD cd %:p:h

" for xml plugin:
let xml_jump_string="``"

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
  silent execute '!C:\Progra~1\Vim\vim72\diff -a ' . opt . '"' . v:fname_in . '" "' . v:fname_new . '" > "' . v:fname_out . '"'
endfunction

let g:miniBufExplMapCTabSwitchBufs = 1
