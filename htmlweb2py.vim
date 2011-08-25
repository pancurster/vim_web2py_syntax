" Vim syntax file
" Language:	web2py HTML template
" Maintainer:	Lukasz Panek <pancurster@gmail.com> based on django syntax by Dave Hodder <dmh@dmh.org.uk>
" Last Change:	2011 05 15

" This syntax file base on django syntax by Dave Hodder
" Apologize to everyone who use this, I'm not a vim hacker :)
" This is broken alpha version of syntax web2py for vim
" If You know how to fix this files for better working 
" email me: pancurster@gmail.com or make a fork and email me to :)
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

if version < 600
  so <sfile>:p:h/web2py.vim
  so <sfile>:p:h/html.vim
else
  runtime! syntax/web2py.vim
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

syn cluster w2pTemplateBlocks contains=w2pPythonStatement,w2pGlobalObjects,w2pArgument,w2pNavigation,w2pInternat,w2pHelpers,w2pHtmlAttributes,w2pComment

"FIXME why 'containedin=ALL' does not work ?
syn region w2pTagBlock start="{{" end="}}" contains=@w2pTemplateBlocks display containedin=ALLBUT,@wrong

hi link w2pTagBlock Normal

let b:current_syntax = "htmlweb2py"
