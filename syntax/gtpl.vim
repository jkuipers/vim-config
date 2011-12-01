" Vim syntax file
" Language:	GTPL (Groovy Template) HTML template
" Maintainer:	Joris Kuipers (joriskuipers@gmail.com)
" Last Change:	2009 Sep 20

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'gtpl'
endif

if version < 600
  so <sfile>:p:h/html.vim
  " next syntax items are case-sensitive
  syn case match
  " include groovy syntax
  syn include @gtplgroovy <sfile>:p:h/groovy.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
  " next syntax items are case-sensitive
  syn case match
  " include groovy syntax
  syn include @gtplgroovy syntax/groovy.vim
endif



syn region gtplScriptlet matchgroup=gtplTag start=/<%/  keepend end=/%>/ contains=@gtplgroovy
syn region gtplExpr      matchgroup=gtplTag start=/\${/ keepend end=/}/  contains=@gtplgroovy

" Redefine htmlTag so that it can contain gtplExpr
syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,gtplExpr

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gtpl_syn_inits")
  if version < 508
    let did_gtpl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  " java.vim has redefined htmlComment highlighting
  HiLink htmlComment	 Comment
  HiLink htmlCommentPart Comment
  " Be consistent with html highlight settings
  HiLink gtplTag		 htmlTag
  delcommand HiLink
endif

if main_syntax == 'gtpl'
  unlet main_syntax
endif

let b:current_syntax = "gtpl"
