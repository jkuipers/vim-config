" Vim syntax file
" Language:	SpringSource dm Server trace log
" Maintainer:	Joris Kuipers (joriskuipers@gmail.com)
" Last change:	4th November 2008

" =============================================================================

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match virgologInfo   /^.*[A-Z][A-Z]\d\d\d\dI .*$/
syn match virgologWarn   /^.*[A-Z][A-Z]\d\d\d\dW .*$/
syn match virgologError  /^.*[A-Z][A-Z]\d\d\d\dE .*$/
syn match virgologDebug  /^.*[A-Z][A-Z]\d\d\d\dD .*$/
syn match virgologTrace  /^.*[A-Z][A-Z]\d\d\d\dT .*$/
syn match virgologSysout /^.* System\.out .*$/
syn match virgologSyserr /^.* System\.err .*$/

" Default highlighting
if version >= 508 || !exists("did_virgolog_syntax_inits")
  if version < 508
    let did_virgolog_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink virgologInfo       Type
  HiLink virgologWarn       Identifier
  HiLink virgologError      Exception
  HiLink virgologDebug      PreProc
  HiLink virgologTrace      Comment
  HiLink virgologSysout     Constant
  HiLink virgologSyserr     Identifier

  delcommand HiLink
endif

let b:current_syntax = "virgolog"
