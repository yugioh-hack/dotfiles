" :Tnew の場合に挿入モードで開始する
let g:neoterm_autoinsert = 1

" :T {cmd} 実行時に画面スクロールをする
let g:neoterm_autoscroll = 1

" 縦分割する
" let g:neoterm_default_mod='vertical'
" 横分割する
let g:neoterm_default_mod='belowright'

let g:neoterm_size = 10

" :Tnew 実行
nnoremap <silent> <C-e><C-t> :Tnew<CR>
" :Tnew 実行(縦分割)
nnoremap <silent> <C-e><C-v> :vertical Tnew<CR>
" 非ビジュアルモード
nnoremap <silent> <C-e><C-e> :TREPLSendLine<CR>
" ビジュアルモード
vnoremap <silent> <C-e><C-e> V:TREPLSendSelection<CR>
" ファイル送信
nnoremap <silent> <C-e><C-f> :TREPLSendFile<CR>
