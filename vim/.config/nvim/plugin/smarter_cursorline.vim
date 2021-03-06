" cursorline_current: If 'cursorline' is globally on, only enable it for the
" current window, and only when not in insert mode. Essentially, make
" 'cursorline' follow the actual normal-mode cursor as much as possible.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
if exists('g:loaded_smarter_cursorline')
  finish
endif
if !has('autocmd') || !has('windows') || v:version < 700
  finish
endif
let g:loaded_smarter_cursorline = 1

" Suspend 'cursorline' when a window is inactive or inserting
function! s:Suspend() abort
  " Fix for highlighting issues with plugins like Snap
  if &buftype == 'prompt'
    return
  endif

  let w:cursorline_current = &l:cursorline
  let &l:cursorline = 0
endfunction

" Restore 'cursorline' when a window is active and non-insert
function! s:Restore() abort
  let &l:cursorline = get(w:, 'cursorline_current', &g:cursorline)
  let w:cursorline_current = &l:cursorline
endfunction

" Call s:Suspend() on all windows besides the current one
function! s:Load() abort

  " Cache current window index
  let l:wcur = winnr()

  " Iterate through all the windows and suspend all but the current one
  for l:wnum in range(1, winnr('$'))
    if l:wnum == l:wcur
      continue
    endif
    execute l:wnum . 'wincmd w'
    call s:Suspend()
  endfor

  " Return to the window in which we started
  execute l:wcur . 'wincmd w'

endfunction

" Set up hooks for toggling 'cursorline'
augroup cursorline_current
  autocmd!

  " Turn off 'cursorline' for other windows on load
  autocmd VimEnter * call s:Load()

  " Turn off 'cursorline' when leaving a window or losing focus. We call the
  " restore again on BufEnter to handle existent local buffer values for the
  " option overwriting the window value (Vim bug?)
  autocmd WinLeave,FocusLost * call s:Suspend()
  autocmd BufEnter,WinEnter,FocusGained * call s:Restore()

  " Turn off 'cursorline' when in insert mode
  " Check g:cursorline_current_insert, in case the user doesn't want it
  if get(g:, 'cursorline_current_insert', 1)
    autocmd InsertEnter * call s:Suspend()
    autocmd InsertLeave * call s:Restore()
  endif

augroup END
