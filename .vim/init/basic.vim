"======================================================
" basic.vim
" 基本的な設定のみを入れておくので変更はあまりしない
"======================================================
"----------------------
" 画面表示の設定
"----------------------
set encoding=utf-8      " 内部文字コードがUTF-8になる
set fileencoding=utf-8  " 読み込み時の文字コード 左側が優先される
set number              " 行番号を表示する
set nocursorline         " カーソル行をハイライト
"set cursorcolumn       " カーソル位置のカラムの背景色を変える
set nocursorcolumn      " 行のハイライトを無効化する
set laststatus=2        " ステータス行を常に表示
set cmdheight=2         " メッセージ表示欄を2行確保
set showmatch           " かっこをいれると対応するものを表示するく
set matchtime=1
set showcmd             " ステータスラインにコマンドを表示
set title               " ウィンドウタイトルを設定する
" 不可視文字の表示記号指定
set list                " 不可視文字を表示
hi SpecialKey ctermfg=darkmagenta
set listchars=trail:_,eol:↲,tab:\¦\
set ambiwidth=double    " □や◯文字が崩れるのを防ぐ
" 半角文字の設定
"set guifont=SourceCodePro-Regular:h15
set guifont=RictyDiscordForPowerline\ Nerd\ Font:h19
" 全角文字の設定
set guifontwide=NotoSansCJKjp-Regular:h14
"set guifont=Ricty\ for\ lightline:h18
"set guifont=DroidSansMonoForPowerline:h16
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set clipboard=unnamed,autoselect " OSとクリップボードを共有する

set lazyredraw     " 同上
set ttyfast        " スクロール描画を早くする
set title          " タイトルを表示する
"---保存時に空白を自動削除----

autocmd BufWritePre * :%s/\s\+$//e
"----------------------
" Syntax
"----------------------
syntax on
set synmaxcol=200  " 1行200文字までsyntaxを有効にしない

au BufRead,BufNewFile *.scss set filetype=sass " .sassに対応させる
"----------------------
" コマンドモードの補完
"---------------------
set wildmenu

"----------------------
" ビープ音
"----------------------
set visualbell t_vb= "ビープ音を無効化
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"-- NormalとInsertでカーソルの形を変える---------------------
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

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

"--------------------------
" カーソル移動関連の設定
"--------------------------
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う


" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
set statusline+=%y

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" バックスペースでの削除をいつでも有効にする
set backspace=indent,eol,start
"--------------
" 文字列検索
"--------------
set incsearch     "インクリメンタルサーチ
set ignorecase    " 検索パターンに大文字小文字を区別しない
set smartcase     " 検索パターンに大文字を含んでいたら大文字小文字区別
set hlsearch      " 検索結果をハイライト

" insertとnormalの切り替えが遅いので
set timeout timeoutlen=1000 ttimeoutlen=50

" ターミナルでマウスを使用できるようにする
if has ("mouse")
    set mouse=a
    set guioptions+=a
    set ttymouse=xterm2
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" .mdまたはmkdはファイルタイプmarkdownとして認識される
" http://qiita.com/ssh0/items/b68263a7866b4ce9eaf1
autocmd BufRead,BufNewFile *.{mkd,md} set filetype=markdown
autocmd! FileType markdown hi! def link markdownItalic Normal
autocmd FileType markdown set commentstring=<\!--\ %s\ -->

" for plasticboy/vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_style_pythonic = 1
