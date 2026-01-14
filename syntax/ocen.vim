if exists("b:current_syntax")
    finish
endif

syn keyword ocenType bool char rchar byte void string untyped typed untyped_ptr
syn keyword ocenType i8 i16 i32 i64 u8 u16 u32 u64
syn keyword ocenType int uint isize usize
syn keyword ocenType float f32 f64

syn keyword ocenKeyword def let var const static typedef 
syn keyword ocenSelf self
syn keyword ocenLabel default as
syn keyword ocenOperator and or
syn keyword ocenConstant true false null nil
syn keyword ocenSComment assert println print
syn match   ocenNew      '\v<(new|[mc]?alloc)>'
syn match   ocenFree     '\v<(free|not)>'

syn keyword ocenRepeat while for in
syn keyword ocenStatement break continue return defer yield
syn keyword ocenConditional if then else match switch case
syn keyword ocenInclude export include extern when foreign opaque public exits invalid
syn keyword ocenInclude c_include c_flag c_embed

syn keyword ocenPanic panic abort
syn keyword ocenException throw try catch cast unsafe
"syn keyword ocenSuper   private

"syn match ocenType      '\v<(\w+)>\ze\s*\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>'
syn match ocenLabel     '\v\@\w*'
syn match ocenSymbol    '[,;:\.]'
syn match ocenOperator  '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match ocenConstant  '[{}\[\]()]'
syn match ocenType      '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match ocenType      '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match ocenType      '\v<\w+_[tscemui]>'
syn match ocenMacro     '\v<[_]*\u[A-Z0-9_]*>'
syn match ocenType      '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
syn match ocenType      '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match ocenRepeat    '\v([^\.](\.|::|-\>))@<=\w\w*'
syn match ocenType      '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match ocenFunc      '\v[_]*\l\w*\ze((\[.*\])|((::)?\<.*\>))*\s*\('
syn match ocenException  '\v(\W@<=[~&*]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[*]+\ze\W)'
"syn match ocenStruct     '\v((type|impl|struct|enum|union|namespace)(\[.*\])?)@<=\s+[_]*\w+'

syn match ocenInclude    '\v^\s*<import>'
syn match ocenMacro      '\v^\s*\[(.{-}(".*")?)+\]'
syn match ocenType       '\v<(str)\ze\s*\('
"syn match ocenAdded      '\v^\s*<(test)\ze\s*\{'

" -- shader
syn match  ocenKeyword  '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>\s'
syn match  ocenType     '\v<(texture|texture2D)>\s'
syn match  ocenType     '\v<bool[234]?>'
syn match  ocenType     '\v<int[234]?>'
syn match  ocenType     '\v<uint[234]?>'
syn match  ocenType     '\v<half[234]?>'
syn match  ocenType     '\v<float([234](x[234])?)?>'
syn match  ocenType     '\v<[dbui]?vec[234]>'
syn match  ocenType     '\v<vec[234][dbfhui]?>'
syn match  ocenType     '\v<mat[234](x[234]f)?>'
syn match  ocenType     '\v<(vec|mat|list)\ze\['


"hi def ocenSymbol ctermfg=DarkGray guifg=DarkGray
hi def link ocenSMacro   SpecialComment
hi def link ocenNew      Added
hi def link ocenFree     Exception
hi def link ocenTitle    Title
hi def link ocenAdded    Added
hi def link ocenStruct   Changed
hi def link ocenConstant Constant
hi def link ocenSymbol   Changed
hi def link ocenMacro    Macro
hi def link ocenSComment SpecialComment
hi def link ocenFunc     Function
hi def link ocenTypedef  Changed
hi def link ocenType     MoreMsg
hi def link ocenSelf     Label
hi def link ocenModeMsg  ModeMsg

syn match  ocenSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  ocenSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  ocenCharacter        "'[^']*'" contains=ocenSpecialChar,ocenSpecialCharError
syn match  ocenCharacter        "'\\''" contains=ocenSpecialChar
syn match  ocenCharacter        "'[^\\]'"

"syn region    ocenString      matchgroup=ocenString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=ocenEscape,@Spell
syn region    ocenString      matchgroup=ocenString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    ocenString      matchgroup=ocenString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match ocenNumber "\v<[0-9_]+>"
syn match ocenNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match ocenNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match ocenFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match ocenFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match ocenFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match ocenFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match ocenFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match ocenFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match ocenFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match ocenEscape '\\[\\'"0abfnrtv]' contained display
syn match ocenEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match ocenFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=ocenEscape display
syn match ocenFormat '{{\|}}' contained display


hi def link ocenPreProc               PreProc
hi def link ocenSuper                 Title
hi def link ocenFloat                 Constant
hi def link ocenInteger               Number
hi def link ocenEscape                SpecialComment
hi def link ocenFormat                SpecialChar

hi def link ocenKeyword               Keyword
hi def link ocenInclude               Include
hi def link ocenLabel                 Label
hi def link ocenConditional           Conditional
hi def link ocenRepeat                Repeat
hi def link ocenStatement             Statement
hi def link ocenNumber                Number
hi def link ocenComment               Comment
hi def link ocenOperator              Operator
hi def link ocenCharacter             Character
hi def link ocenString                String
hi def link ocenTodo                  Todo
hi def link ocenSpecial               Special
hi def link ocenSpecialError          Error
hi def link ocenSpecialCharError      Error
hi def link ocenString                String
hi def link ocenCharacter             Character
hi def link ocenSpecialChar           SpecialChar
hi def link ocenException             Exception
hi def link ocenPanic                 Exception

syn match   ocenTypedef  contains=ocenTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match   ocenFunc     "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
"syn keyword ocenKeyword union struct namespace enum type nextgroup=ocenTypedef skipwhite skipempty
syn keyword ocenKeyword union struct namespace enum type nextgroup=ocenTypedef skipwhite
syn keyword ocenKeyword union nextgroup=ocenType skipwhite skipempty contained
syn keyword ocenMacro macro nextgroup=ocenTypedef skipwhite skipempty
" adapted from neovim runtime/syntax
syn keyword ocenTodo contained TODO FIXME XXX NOTE
syn region  ocenComment  start="/\*" end="\*/" contains=ocenTodo,@Spell
syn match   ocenComment  "//.*$" contains=ocenTodo,@Spell
syn match   ocenPreProc  '\#.*$'

let b:current_syntax = "ocen"

