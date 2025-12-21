#### Vim plugin for ocen programming
```vim
Plug 'angluca/ocen.vim'
Plug 'yegappan/lsp'

if has("win32")
let $VIM=$HOME.'/vimfiles/'
else
let $VIM=$HOME.'/.vim/'
endif
au FileType ocen setl tags+=$VIM/bundle/ocen.vim/tags/ocen.tags
au FileType ocen setl dict+=$VIM/bundle/ocen.vim/tags/ocen.dict
au FileType ocen setl dict+=$VIM/bundle/ocen.vim/tags/ocen.base.dict

"au FileType ocen let $OCEN_RAYLIB = ~/raylib/include
"au FileType ocen setl tags+=$VIM/bundle/ocen.vim/tags/raylib.tags
"au FileType ocen setl dict+=$VIM/bundle/ocen.vim/tags/raylib.dict

set cot=menuone,noinsert,popup,fuzzy
set autocomplete
set cpt=F,o,k^20,.^20,b^10,w^10,s^20,i^20,t^20,u^10
```
quickly building use `:make`

