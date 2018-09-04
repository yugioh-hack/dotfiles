" change display mapping

"--------------------------------
" スペースバーをLeaderに割当

let mapleader = "\<Space>"

"--------------------------------
" shift+yで行末までをコピー
nnoremap Y y$

"--------------------------------
" Shift+hjklで移動量を大きく
"noremap H 3h
"noremap J 3j
"noremap K 3k
"noremap L 3l

"--------------------------------
" CTRL-hjklでウィンドウ移動
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-k>j
nnoremap <C-l> :<C-l>j
nnoremap <C-h> :<C-h>j

"--------------------------------
" Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>

" 保存時に行末の空白を除去
autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" 行頭と行末へカーソル移動
inoremap <C-h> <Esc>$a
inoremap <C-l> <Esc>^a
"noremap <C-h> <Esc>$a
"noremap <C-l> <Esc>^a
noremap <Leader>h ^
noremap <Leader>l $

"----------------------------------
" 表示されている行単位での上下移動

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

" タブを増やす
"nnoremap <C-t> :tabnew
"inoremap ' ''<LEFT>

" Tab jump
noremap t1 1gt
noremap t2 2gt
noremap t3 3gt
noremap t4 4gt
noremap t5 5gt
noremap t6 6gt
noremap t7 7gt
noremap t8 8gt
noremap t9 9gt
noremap t0 :tablast<cr>

"----------------------------------
" terminal
tnoremap <silent> <ESC> <C-\><C-n>

"===================================================="
" http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca "
"===================================================="

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"call submode#map('bufmove', 'n', '', '<', '<C-w><')
"call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"call submode#map('bufmove', 'n', '', '-', '<C-w>-')
