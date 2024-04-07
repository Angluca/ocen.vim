#### Vim plugin for ocen programming

You can install [vimcomplete](https://github.com/girishji/vimcomplete) and setting [ocen.tags](https://github.com/Angluca/AcVim/blob/master/vimfiles/dict/ocen.tags)  
[ocen.base.dict](https://github.com/Angluca/AcVim/blob/master/vimfiles/dict/ocen.base.dict) with [ocen.dict](https://github.com/Angluca/AcVim/blob/master/vimfiles/dict/ocen.dict) for autocomple If you use vim  
quickly building use ```:make```
```vim
au FileType ocen let $OCENLIB = ~/ocen/std'
au FileType ocen setl tags=~/dict/ocen.tags
au FileType ocen setl dict=~/dict/ocen.base.dict,~/dict/ocen.dict
```
