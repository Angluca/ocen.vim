if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

compiler ocen

" Formatting
setlocal formatoptions+=croql/ formatoptions-=t

" Miscellaneous settings
setlocal comments=://
setlocal commentstring=//\ %s
setlocal iskeyword+=@-@
setlocal suffixesadd=.oc

let b:undo_ftplugin = 'setl cms< com< fo< isk< sua<'

" Follow the ocen style guide by default.
if get(g:, 'ocen_recommended_style', 1)
  setlocal expandtab
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal tabstop=4
  setlocal textwidth=80
  let b:undo_ftplugin .= ' et< sts< sw< ts< tw<'
endif

fu! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+\r\?$//ge
    nohl
    exe "normal `z"
endf

" Auto delete trailing white_space if save.
if get(g:, 'ocen_save_cls', 1)
  au BufWrite *.oc call DeleteTrailingWS()
endif

augroup ocen.vim
  autocmd!

  " Highlight incorrect spacing by default.
  if get(g:, 'ocen_space_error', 1)
    autocmd InsertEnter * hi link ocenSpaceError NONE
    autocmd InsertLeave * hi link ocenSpaceError Error
  endif
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: et sw=2 sts=2 ts=8
