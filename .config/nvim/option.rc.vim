"-------------------------------------------------
" Basic

"" Encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,usc-bom,iso-2022-jp,sjis

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set nohlsearch

"" Indent

set shiftwidth=2 "インデントの各段階に使われる空白の数
set autoindent  "新しい行を開始した時、新しい行と現在の行のインデントを同じにする
set tabstop=2    "<Tab>の空白数
"set smartindent  "インデントをスマートインデント
set cindent      "スマートインデントよりお利口

set scrolloff=5  " スクロール送りを開始する前後の行数を指定
set ambiwidth=double "□や◯文字が崩れるのを防ぐ
set cmdheight=2 "コマンドラインに使われる画面上の行数
set nocursorline "現在の行を強調表示
set norelativenumber
set nocursorcolumn "行末の1文字先までカーソルを移動
set expandtab   "タブの代わりに空白文字を挿入
set hidden
set list
"set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=trail:~
set listchars=tab:-\ ,trail:_,eol:↲
set nobackup   "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set number     "行番号を表示
set ruler      "カーソルが何行目の何列目に置かれているかを表示する
set showcmd
set showmatch    "閉じ【】が入力された時対応する開き括弧に僅かの間ジャンプする
set matchtime=1  "showmatchのジャンプ時間 0.1*N秒
set title         "ウィンドウタイトルを設定
set whichwrap=b,s,h,l,<,>,[,],~
set wrapscan   "検索がファイル末尾まで進んだらファイル先頭から再び検索する
set wrap
set display=lastline
set shellslash
" フォント
" set guifont=SoureceCodePro-Regular:h15
" set guifontwide=NotoSansCJKjp-Regular:h15
set guifont=Cica:h14
set printfont=Cica:h12
" set renderingoptions=type:directx,renmode:5

if has('nvim')
  set clipboard+=unnamedplus
  if has('mouse')
    set mouse=
  endif
else
  set laststatus=2
  set wildmenu
  set clipboard=unnamed,autoselect
  set backspace=indent,eol,start
endif

" syntax
set synmaxcol=600 "1行600文字までsyntaxを有効にしない
au BufRead,BufNewFile *.scss set filetype=sass " .sassに対応させる
au BufRead,BufNewFile,BufReadPre *.jade set filetype=pug " pugをjadeと互換性を保って利用する
au BufEnter *.php :set syn=wordpress
au BufNewFile,BufRead *.pcss set filetype=css " postcssにcssシンタックスを適用
au BufRead,BufNewFile *.md set filetype=markdown " .md でもfiletype markdownが適用される
set re=0

" ファイルによってインデントを変える
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd FileType jsp,asp,php,xml,perl syntax sync minlines=100 maxlines=200

" jsonのダブルクオーテーションを常に表示する
let g:vim_json_syntax_conceal = 0
"let g:indentLine_noConcealCursor=""

"----------------------
" ビープ音
"----------------------
set visualbell t_vb= "ビープ音を無効化
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"-------------------------------------------------------------
" 全角文字をハイライト表示
" http://qiita.com/ysakmrkm@github/items/4a51c2f02ba5e6a5a3b4
"-------------------------------------------------------------
function! Zenkaku()
    highlight Zenkaku cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction


if has('syntax')
  augroup Zenkaku
    autocmd!
    autocmd ColorScheme       * call Zenkaku()
    autocmd VimEnter,WinEnter * let w:m1 = matchadd("Zenkaku", '[　０１２３４５６７８９]')
    autocmd VimEnter,WinEnter * let w:m2 = matchadd("Zenkaku", '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
    autocmd VimEnter,WinEnter * let w:m3 = matchadd("Zenkaku", '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
  augroup END
  call Zenkaku()
endif

"==================================="
" ウィンドウを分割しつつ
" コードを書くときは1ウィンドウにする
" ctrl + m
"==================================="

let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap <C-m> :call ToggleWindowSize()<CR>
