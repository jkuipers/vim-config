" Vim syntax file
" Language:	SpringSource dm Server trace log
" Maintainer:	Joris Kuipers (joriskuipers@xs4all.nl)
" Last change:	4th November 2008

" =============================================================================

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match dmservertraceInfo   /^.* I .*$/
syn match dmservertraceWarn   /^.* W .*$/
syn match dmservertraceError  /^.* E .*$/
syn match dmservertraceEnter  /^.* > .*$/
syn match dmservertraceExit   /^.* < .*$/

" Default highlighting
if version >= 508 || !exists("did_dmservertrace_syntax_inits")
  if version < 508
    let did_dmservertrace_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink dmservertraceEnter      Comment
  HiLink dmservertraceExit       Comment
  HiLink dmservertraceInfo       Constant
  HiLink dmservertraceWarn       Function
  HiLink dmservertraceError      Exception

  delcommand HiLink
endif

let b:current_syntax = "dmservertrace"
