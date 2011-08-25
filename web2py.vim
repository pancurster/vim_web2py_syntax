" Vim syntax file
" Language:	web2py template
" Maintainer:	Lukasz Panek <pancurster@gmail.com> based on django syntax by Dave Hodder <dmh@dmh.org.uk>
" Last Change:	2011 05 15

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

" web2py - python keywords
syn keyword w2pPythonStatement contained for in while 
syn keyword w2pPythonStatement contained if elif else
syn keyword w2pPythonStatement contained try except finally
syn keyword w2pPythonStatement contained def return lambda class 
syn keyword w2pPythonStatement contained exec print eval pass
syn keyword w2pPythonStatement contained import from as
syn keyword w2pPythonStatement contained not and or True False
syn keyword w2pPythonStatement contained del yeld global with assert
syn keyword w2pPythonStatement contained break continue raise

" web2py keywords
syn keyword w2pGlobalObjects contained request response session cache 

syn keyword w2pNavigation contained redirect HTTP

syn keyword w2pInternat contained T

syn keyword w2pHelpers contained XML URL BEAUTIFY
syn keyword w2pHelpers contained A B BEAUTIFY BODY BR CENTER CODE DIV EM EMBED
syn keyword w2pHelpers contained FIELDSET FORM H1 H2 H3 H4 H5 H6 HEAD HR HTML
syn keyword w2pHelpers contained I IFRAME IMG INPUT LABEL LEGEND LI LINK OL UL
syn keyword w2pHelpers contained MARKMIN MENU META OBJECT ON OPTION P PRE SCRIPT
syn keyword w2pHelpers contained OPTGROUP SELECT SPAN STYLE TABLE TAG TD TEXTAREA
syn keyword w2pHelpers contained TH THEAD TBODY TFOOT TITLE TR TT URL XHTML
syn keyword w2pHelpers contained xmlescape embed64 SQLFORM SQLTABLE

syn keyword w2pValidators CLEANUP CRYPT IS_ALPHANUMERIC IS_DATE_IN_RANGE IS_DATE
syn keyword w2pValidators IS_DATETIME_IN_RANGE IS_DATETIME IS_DECIMAL_IN_RANGE
syn keyword w2pValidators IS_EMAIL IS_EMPTY_OR IS_EXPR IS_FLOAT_IN_RANGE IS_IMAGE
syn keyword w2pValidators IS_IN_DB IS_IN_SET IS_INT_IN_RANGE IS_IPV4 IS_LENGTH
syn keyword w2pValidators IS_LIST_OF IS_LOWER IS_MATCH IS_EQUAL_TO IS_NOT_EMPTY
syn keyword w2pValidators IS_NOT_IN_DB IS_NULL_OR IS_SLUG IS_STRONG IS_TIME
syn keyword w2pValidators IS_UPLOAD_FILENAME IS_UPPER IS_URL

syn keyword w2pDatabase DAL Field

syn keyword w2pHtmlAttributes contained _href _id _class _src _type
syn keyword w2pHtmlAttributes contained _value

"like python comment 
"FIXME this goes wrong: {{# coment }} but this:
"{{# coment
"}}
"is ok...
syn match w2pComment /#.*/ contained keepend
syn region w2pComment start=/{{#/ end=/}}/ contains=w2pTodo contained

" Keywords to highlight within comments
syn keyword w2pTodo contained TODO FIXME XXX

" web2py template constants 
syn region w2pArgument contained start=/'/ skip=/\\'/ end=/'/
syn region w2pArgument contained start=/"/ skip=/\\"/ end=/"/

" web2py template tag 
syn region djangoTagBlock start="{{" end="}}" contains=w2pPythonStatement,w2pGlobalObjects,w2pArgument,w2pNavigation,w2pInternat,w2pHelpers,w2pHtmlAttributes display

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_w2p_syn_inits")
  if version < 508
    let did_w2p_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink w2pPythonStatement Statement
  HiLink w2pGlobalObjects Special
  HiLink w2pArgument Constant
  HiLink w2pNavigation Special
  HiLink w2pInternat PreProc
  HiLink w2pHelpers PreProc
  HiLink w2pValidators PreProc
  HiLink w2pDatabase Statement
  HiLink w2pHtmlAttributes Identifier
  HiLink w2pComment Comment
  HiLink w2pComment2 Comment

  delcommand HiLink
endif

let b:current_syntax = "web2py"
