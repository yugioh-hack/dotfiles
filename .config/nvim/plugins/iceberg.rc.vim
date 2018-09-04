au MyAutoCmd VimEnter * nested colorscheme iceberg
" backgroung transparency for Ubuntu
if has('unix')
  au MyAutoCmd VimEnter * highlight Normal ctermbg=none
  au MyAutoCmd VimEnter * highlight NonText ctermbg=none
  au MyAutoCmd VimEnter * highlight TablineSel ctermbg=none
  au MyAutoCmd VimEnter * highlight LineNr ctermbg=none
  au MyAutoCmd VimEnter * highlight CursorLineNr ctermbg=none
  au MyAutoCmd VimEnter * highlight Folded ctermbg=none
endif
" Visual mode
au MyAutoCmd VimEnter * highlight Visual ctermbg=216
"
" 初期状態はcursorlineを表示しない
" 以下の一行は必ずcolorschemeの設定後に追加すること
hi clear CursorLine

" 'cursorline' を必要な時にだけ有効にする
" http://d.hatena.ne.jp/thinca/20090530/1243615055
" を少し改造、number の highlight は常に有効にする
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  setlocal cursorline
  hi clear CursorLine

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      hi CursorLine term=underline cterm=underline guibg=Grey90 " ADD
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
      hi clear CursorLine " ADD
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          " setlocal nocursorline
          hi clear CursorLine " ADD
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      " setlocal cursorline
      hi CursorLine term=underline cterm=underline guibg=Grey90 " ADD
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END
