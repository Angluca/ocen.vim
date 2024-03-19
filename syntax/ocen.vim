" PRELUDE {{{1
" Vim syntax file

if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'ocen'

" SYNTAX {{{1
syn case match

"syn match Repeat        
syn match PreProc        '[><]'
syn match Exception      '[\&|\^]\|>>\|<<\|*'
syn match Operator       '[,\+\-\%;=\/]\|\^\^\|*\s\|*='
syn match SpecialComment '[`:\.]'
syn match Constant       '[{}\[\]()]'
syn match PreProc        '&&\|||\|!=\|==\|!\|>=\|<='

" KEYWORDS {{{2
syn keyword ocenCast as is
syn keyword ocenConditional if then else match switch
syn keyword ocenKeyword break continue defer return yield
syn keyword ocenKeyword const def let
"syn keyword ocenKeyword fn
syn keyword ocenLabel case
syn keyword ocenRepeat for while
syn keyword ocenStorageClass export static
syn keyword ocenStructure enum struct union
"syn keyword ocenTypedef type

" Attributes
syn keyword ocenAttribute extern exits invalid
syn match ocenAttribute '@\w\+'
"syn match ocenAttributeError '^\[\w\+\]'

" BUILTINS {{{2
syn keyword ocenBuiltin abort assert
syn keyword ocenBuiltin align len offset
syn keyword ocenBuiltin alloc free calloc malloc
syn keyword ocenBuiltin append insert delete

" C ABI
"syn keyword ocenBuiltin vastart vaarg vaend

" TYPES {{{2
syn keyword ocenType bool
syn keyword ocenType f32 f64
syn keyword ocenType i8 i16 i32 i64 u8 u16 u32 u64 char
syn keyword ocenType int uint untyped_ptr
syn keyword ocenType str
syn keyword ocenType void

" `size` can either be a builtin or a type. Match it as a type by default,
" unless the next non-comment token is an open paren, in which case prioritize
" matching it as a builtin.
syn match ocenType '\v<size>' display
syn match ocenBuiltin '\v<size>\ze(\_s*|//.*\_$)*\(' display

" LITERALS {{{2
syn keyword ocenBoolean true false
syn keyword ocenNull null

" Floating-point number literals
syn match ocenFloat '\v<(0|[1-9]\d*)\.\d+([eE][+-]?\d+)?(f32|f64)?>' display
syn match ocenFloat '\v<(0|[1-9]\d*)([eE][+-]?\d+)?(f32|f64)>' display
syn match ocenFloat '\v<0x\x+(\.\x+)?[pP][+-]?\d+(f32|f64)?>' display

" Integer literals
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iu](8|16|32|64)?|z)?>' display
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iu](8|16|32|64)?|z)?>' display
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iu](8|16|32|64)?|z)?>' display
syn match ocenInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iu](8|16|32|64)?|z)?>' display

" Escape sequences
syn match ocenEscape '\\[\\'"0abfnrtv]' contained display
syn match ocenEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display

" Format sequences
syn match ocenFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=ocenEscape display
syn match ocenFormat '{{\|}}' contained display

" Rune and string literals
syn region ocenRune start="'" end="'\|$" skip="\\'" contains=ocenEscape display
syn region ocenString start='"' end='"\|$' skip='\\"' contains=ocenEscape,ocenFormat display
syn region ocenString start='`' end='`' contains=ocenFormat display

" MISCELLANEOUS {{{2
syn keyword ocenTodo FIXME TODO XXX contained

" Blocks
syn region ocenBlock start='{' end='}' fold transparent

" Comments
syn region ocenComment start='//' end='$' contains=ocenCommentDoc,ocenTodo,@Spell display
syn match ocenCommentRef '\v\[\[\h\w*(::\h\w*)*(::)?]]' contained display

" Match `!` as an error assertion operator only if the previous non-comment
" token is a closing paren, `!` or `?`, or a valid identifier followed by an
" optional tuple field access. Do not include `!=` in the matches.
syn match ocenErrorAssertion '\v((\h\w*(\.\d+)*|[!?]|\))(\_s*|//.*\_$)*)@<=!\=@!' display
syn match ocenErrorPropagation '?' display

" Incorrect whitespace
syn match ocenSpaceError '\v\s+$' display
syn match ocenSpaceError '\v\zs +\ze\t' display

" Use statement
syn region ocenUse start='\v^\s*\zsuse>' end=';' contains=ocenComment display

" DEFAULT HIGHLIGHTING {{{1
hi def link ocenAttribute PreProc
hi def link ocenBoolean Boolean
hi def link ocenBuiltin Function
hi def link ocenCast Operator
hi def link ocenComment Comment
hi def link ocenCommentRef SpecialComment
hi def link ocenConditional Conditional
hi def link ocenEscape SpecialChar
hi def link ocenFloat Float
hi def link ocenFormat SpecialChar
hi def link ocenInteger Number
hi def link ocenKeyword Keyword
hi def link ocenLabel Label
hi def link ocenNull Constant
hi def link ocenRepeat Repeat
hi def link ocenRune Character
hi def link ocenStorageClass StorageClass
hi def link ocenString String
hi def link ocenStructure Structure
hi def link ocenTodo Todo
hi def link ocenType Type
hi def link ocenTypedef Typedef
hi def link ocenUse Include

" Default highlighting for error propagation operators
hi def ocenErrorAssertion ctermfg=red cterm=bold guifg=red gui=bold
hi def ocenErrorPropagation ctermfg=red cterm=bold guifg=red gui=bold

" Highlight invalid attributes.
hi def link ocenAttributeError Error

" vim: et sw=2 sts=2 ts=8