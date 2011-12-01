" Vim syntax file
" Language:	Java Manifest file (MANIFEST.MF)
" Maintainer:	Joris Kuipers (joriskuipers@gmail.com)
" Last Change:	25th June 2008

" =============================================================================

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if exists("b:jmanifest_ignore_line_length")
  syn match jmanifestValue        /.*/ contained nextgroup=jmanifestCont skipnl
else
  syn match jmanifestValue        /.*\%<74c/ contained nextgroup=jmanifestCont skipnl
  syn match jmanifestExtraChars   /\%>72c.*$/
endif
syn match jmanifestName         /^[A-Za-z0-9][A-Za-z0-9\-_]\{,69}\ze: \?/ nextgroup=jmanifestColon
syn match jmanifestColon        /: \?/ contained nextgroup=jmanifestValue

" nice and short, but causes issues when very large with too little history
"syn match jmanifestValue        /\_.\{-}\ze\_^\([^ ]\|\%$\)/ contained

" adding 'contained' to jmanifestCont is more precise, but also causes issues with
" many continuation lines not being parsed properly with too little history
syn match jmanifestCont         /^ / nextgroup=jmanifestValue skipnl
" Header names are not allowed to start with "From"
syn match jmanifestFromHeader    /^From/

" Default highlighting
if version >= 508 || !exists("did_jmanifest_syntax_inits")
  if version < 508
    let did_jmanifest_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink jmanifestName	        Identifier
  HiLink jmanifestColon         Operator
  HiLink jmanifestValue         Constant
  HiLink jmanifestExtraChars    Error
  HiLink jmanifestFromheader    Error

  delcommand HiLink
endif

let b:current_syntax = "jmanifest"
