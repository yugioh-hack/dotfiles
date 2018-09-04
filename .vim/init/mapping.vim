" mapping.vim
"---------------------------------------------------------------"
" モード                          | 再割当て無し | 再割当てあり |
" ノーマルモード+ビジュアルモード | noremap      | map          |
" コマンドモード+インサートモード | noremap!     | map!         |
" ノーマルモード                  | nnoremap     | nmap         |
" ビジュアルモード                | vnoremap     | vmap         |
" コマンドラインモード            | cnoremap     | cmap         |
" インサートモード                | inoremap     | imap         |
"---------------------------------------------------------------"

" -----使い方--------------------------------------------------------------------------"
" コマンド名([n/v/c/i][nore]map]) <オプション> ユーザーが入力する操作 Vimが解釈する操作

"--------------------------------------------------------------------------------------"
"---スペースバーをLeaderに割り当てる--
let mapleader = "\<Space>"
"---------------------------------
" インサートモードから抜ける
"---------------------------------
inoremap jj <ESC>
inoremap <C-c> <ESC>
"---------------------------------------------------
" 検索によるハイラインサートモードイト表示を解除する
"---------------------------------------------------
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

"---------------------------------
" 入力モードでのカーソル移動
"---------------------------------
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"----------------------------------
" 表示されている行単位での上下移動
"----------------------------------
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up>   gk

" 括弧をいれると自動で閉じてくれる
inoremap { {}<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<LEFT>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" 行頭・行末に移動する
noremap <Leader>h ^
noremap <Leader>l $
" 保存・終了する
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" タブを移動する
nnoremap <Leader>t gt
nnoremap <Leader>T gT
" ウィンドウ間を移動する
nnoremap <Leader><Tab> <C-w>w

" space+/で行の先頭にコメントをつけたり外したりできる
nmap <Leader>/ <Plug>(caw:i:toggle)
vmap <Leader>/ <Plug>(caw:i:toggle)

" タブを増やす
nnoremap <C-t> :tabnew

"------------------Vimfiler-------------------------------"

" 現在のファイルのディレクトリでvimfilerを開く。
nnoremap <C-f> :VimFilerCurrentDir<CR>
inoremap <C-f> <ESC>:VimFilerCurrentDir<CR>

" トグル設定
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>


