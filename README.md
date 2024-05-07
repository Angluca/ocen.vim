#### Vim plugin for ocen programming
```vim
Plug 'angluca/ocen.vim'
Plug 'girishji/vimcomplete'
Plug 'yegappan/lsp'

if has("win32")
let $VIM=$HOME.'/vimfiles/'
else
let $VIM=$HOME.'/.vim/'
endif
au FileType ocen let $OCEN = $HOME.'/SDK/Ocens/ocen/std'
au FileType ocen setl tags+=$VIM/bundle/ocen.vim/tags/ocen.tags
au FileType ocen setl dict+=$VIM/bundle/ocen.vim/tags/ocen.dict
au FileType ocen setl dict+=$VIM/bundle/ocen.vim/tags/ocen.base.dict

"au FileType ocen let $RAYLIB = $HOME.'/SDK/Ocens/raylib-ocen/c/include'
"au FileType ocen setl tags+=$VIM/bundle/ocen.vim/tags/raylib.tags
"au FileType ocen setl dict+=$VIM/bundle/ocen.vim/tags/raylib.dict
```
You can install [vimcomplete](https://github.com/girishji/vimcomplete) and setting for autocomple  
quickly building use ```:make```

