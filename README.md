#### Vim plugin for ocen programming  
Install using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'angluca/ocen.vim'
Plug 'yegappan/lsp'

setl omnifunc=LspOmniFunc
au filetype ocen call LspAddServer([#{
            \    name: 'ocen',
            \    filetype: ['ocen'],
            \    path: 'ocen',
            \    args: ['lsp-server']
            \  }])
```
quickly building use `:make`

