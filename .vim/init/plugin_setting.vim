"--------------------
" VimFilerの設定
"--------------------

" VimFilerをデフォルトのファイラーにする
let g:vimfiler_as_default_explorer=1
" フォルダを開いてもツリー表示にする
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" vimを開いたらvimfilerを開く
" autocmd VimEnter * VimFilerExplorer
" vimfilerで除外するファイル
let g:vimfiler_ignore_pattern = '^\%(.git\|.idea\|.DS_Store\)$'
" Vimfilerで自動でカレントディレクトリを変更する
let g:vimfiler_enable_auto_cd = 1
"let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '&#9662;'
"let g:vimfiler_tree_closed_icon = '&#9656;'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
"-------------  キーの機能 -----------------------|
" o   |  バッファを縦分割 or ディレクトリ同期       |
" O   |  別バッファに選択中のディレクトリの中を展開 |
" gs  |  セーフモード on/off                        |
" q   |  VimFilerを終了                             |
"---------------------------------------------------

"---------------------------------------------
" contextで判断してハイライト等を切り替える設定
"---------------------------------------------
let g:context_filetype#filetypes = {
            \ 'html': [
            \   {
            \    'start':
            \     '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
            \    'end': '</script>', 'filetype': 'javascript',
            \   },
            \   {
            \    'start': '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)\?>',
            \    'end': '</style>', 'filetype': 'css',
            \   },
            \   {
            \    'start': '<?php\?',
            \    'end': '?>', 'filetype': 'php',
            \   }
            \ ],}
" }}}

" vim-gitgutter
"let g:gitgutter_sign_added = '✚'
"let g:gitgutter_sign_modified = '➜'
"let g:gitgutter_sign_removed = '✘'

" vim-filer
let g:vimfiler_edit_action = 'tabopen'  " eで新規タブで開くようにする-
nnoremap <silent> <Leader>z :<C-u>VimFilerBufferDir -split -simple -winwidth=40 -toggle -no-quit<CR>

" ------------------------------------------------------
" LightLineの設定
" http://itchyny.hatenablog.com/entry/20130828/1377653592
" http://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
"--------------------------------------------------------
"ここから設定ファイル

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"        \ 'colorscheme': 'wombat',
"        \ 'mode_map': {'c': 'NORMAL'},
"        \ 'active': {
"        \   'left': [
"        \     ['mode', 'paste'],
"        \     ['fugitive', 'gitgutter', 'filename']
"        \   ]
"        \ },
"        \ 'inactice': {
"        \    'left':[
"        \       ['filename']
"        \    ],
"        \    'right':[
"        \       ['char_counter'],
"        \       ['fileformat','fileencoding','filetype']
"        \    ]
"        \ },
"        \ 'component_function': {
"        \   'modified': 'MyModified',
"        \   'readonly': 'MyReadonly',
"        \   'fugitive': 'MyFugitive',
"        \   'filename': 'MyFilename',
"        \   'fileformat': 'MyFileformat',
"        \   'filetype': 'MyFiletype',
"        \   'fileencoding': 'MyFileencoding',
"        \   'mode': 'MyMode',
"        \   'syntastic': 'SyntasticStatuslineFlag',
"        \   'charcode': 'MyCharCode',
"        \   'gitgutter': 'MyGitGutter',
"        \ },
"        \ }
"function! MyModified()
"  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"endfunction

"function! MyReadonly()
  "return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
"endfunction

"function! MyFilename()
"  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"        \  &ft == 'unite' ? unite#get_status_string() :
"        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
"        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"        \ ('' != MyModified() ? ' ' . MyModified() : '')
"endfunction

"function! MyFugitive()
"  try
"    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"      let _ = fugitive#head()
"      return strlen(_) ? '⭠ '._ : ''
"    endif
"  catch
"  endtry
"  return ''
"endfunction

"function! MyFileformat()
"  return winwidth('.') > 70 ? &fileformat : ''
"endfunction

"function! MyFiletype()
  "return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction

"function! MyFiletype()
"  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
"endfunction

"function! MyFileformat()
"  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
"endfunction

"function! MyFileencoding()
  "return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction

"function! MyMode()
  "return winwidth('.') > 60 ? lightline#mode() : ''
"endfunction

"function! MyGitGutter()
"  if ! exists('*GitGutterGetHunkSummary')
"        \ || ! get(g:, 'gitgutter_enabled', 0)
"        \ || winwidth('.') <= 90
"    return ''
"  endif
"  let symbols = [
"        \ g:gitgutter_sign_added . ' ',
"        \ g:gitgutter_sign_modified . ' ',
"        \ g:gitgutter_sign_removed . ' '
"        \ ]
"  let hunks = GitGutterGetHunkSummary()
"  let ret = []
"  for i in [0, 1, 2]
"    if hunks[i] > 0
"      call add(ret, symbols[i] . hunks[i])
"    endif
"  endfor
"  return join(ret, ' ')
"endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
"function! MyCharCode()
"  if winwidth('.') <= 70
"    return ''
"  endif

  " Get the output of :ascii
"  redir => ascii
"  silent! ascii
"  redir END


"  if match(ascii, 'NUL') != -1

"    return 'NUL'

"  endif

  " Zero pad hex values
"  let nrformat = '0x%02x'

"  let encoding = (&fenc == '' ? &enc : &fenc)

"  if encoding == 'utf-8'
"    " Zero pad with 4 zeroes in unicode files
"    let nrformat = '0x%04x'
"  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
"  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
"  let nr = printf(nrformat, nr)

"return "'". char ."' ". nr
"endfunction

  " lightlineの設定終了

  "-------------------------
  " neocompleteの設定
  "-------------------------
  " Vim起動時にneocompleteを有効にする
      let g:neocomplete#enable_at_startup = 1
      " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
      let g:neocomplete#enable_smart_case = 1
      " 3文字以上の単語に対して補完を有効にする
      let g:neocomplete#min_keyword_length = 3
      " 区切り文字まで補完する
      let g:neocomplete#enable_auto_delimiter = 1
      " 1文字目の入力から補完のポップアップを表示
      let g:neocomplete#auto_completion_start_length = 1
      " バックスペースで補完のポップアップを閉じる
      inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

      " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
      imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
      " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
      imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
  "====== Markdown関連の設定======
  au BufRead,BufNewFile *.md set filetype=markdown

  "======Emmet=====
  let g:user_emmet_leader_key = '<C-e>'

"" for hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft = 'html\|vim\|ruby\|sh'

"vimのインデントガイド（賢いやつ
"https://github.com/Yggdroot/indentLine
let g:indentLine_color_term = 239

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
