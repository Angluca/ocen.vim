if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

if !has("cindent") || !has("eval")
  finish
endif

"setlocal cindent
setlocal expandtab
setlocal nolisp
"setlocal autoindent

" L0 -> don't deindent labels
" (s -> use one indent after a trailing (
" m1 -> if ) starts a line, indent it the same as its matching (
" ks -> add an extra indent to extra lines in an if expression or for expression
" j1 -> indent code inside {} one level when in parentheses
" J1 -> see j1
" *0 -> don't search for unclosed block comments
" #1 -> don't deindent lines that begin with #
"setlocal cinoptions=Ls,l1,g0,t0,(s,m1,j1,J1,p0

" Controls which keys reindent the current line.
" 0{     -> { at beginning of line
" 0}     -> } at beginning of line
" 0)     -> ) at beginning of line
" 0]     -> ] at beginning of line
" !^F    -> <C-f> (not inserted)
" o      -> <CR> or `o` command
" O      -> `O` command
" e      -> else
" 0=case -> case
setlocal indentkeys=o,O,0{,0},0),0],!^F, ",!<Tab>
"setlocal cinwords=if,else,for,while,switch,match
setlocal indentexpr=GetOcenIndent(v:lnum)

let b:undo_indent = "setlocal cindent< cinkeys< cinoptions < indentexpr <"

function! GetOcenIndent(lnum)
    let currentLineNum = a:lnum
    let currentLine = getline(a:lnum)

    " cindent doesn't handle multi-line strings properly, so force no indent
    if currentLine =~ '^\s*\\\\.*'
        return -1
    endif

    let prevLineNum = prevnonblank(a:lnum-1)
    let prevLine = getline(prevLineNum)
    let sw = shiftwidth()

    if currentLine =~ '\v^\s*[)\]}]\s*(\/\/.*)?$'
        return indent(currentLineNum)
    endif
    if prevLine =~ '\v^\s*break\s*(\/\/.*)?$'
        return indent(prevLineNum) - sw
    endif
    if prevLine =~ '\v([(\[{:])\s*(\/\/.*)?$'
        return indent(prevLineNum) + sw
    endif
    if prevLine =~ '\v([^(]&[^\[]&[^\{]&[^:])\s*$'
        return indent(prevLineNum)
    endif

    return cindent(a:lnum)
endfunction

