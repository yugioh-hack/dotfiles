"------------------------------------------------------
" vimrcの設定の参考資料
" http://rcmdnk.github.io/blog/2016/03/10/computer-vim/
"------------------------------------------------------

"--------------------------------------------------------
" dein vimの設定
" NeoBundle から dein.vim に乗り換えたら爆速だった話
" http://qiita.com/delphinus/items/00ff2c0ba972c6e41542
"--------------------------------------------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " ファイル保存時に余分なスペースを削除する
  autocmd BufWritePre * :FixWhitespace

  " NerdTree
  "  call dein#add('scrooloose/nerdtree')
" autocmd vimenter * if !argc() | NERDTree | endif

"  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"  endfunction
"    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

  " 不可視ファイルを表示する
"  let NERDTreeShowHidden = 1
"  let g:NERDTreeshowBookmarks = 1 " ブックマークを初期表示
"  autocmd vimenter * NERDTree     " 起動時にNERDTreeを表示
  " ツリーと編集領域を移動する
"  nmap <Leader><Tab> <C-w>w

" vim-indent-guides
" Vim 起動時 vim-indent-guides を自動起動
"  let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
"  let g:indent_guides_start_level=2
" 自動カラー無効
"  let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
"  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
"  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
"  let g:indent_guides_guide_size = 1

  " colorscheme onedark

  "HTMLのとじタグ設定
  augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  augroup END

  " neocom
  call dein#add('Shougo/neocomplcache')

  " Airline
  " let g:airline_powerline_fonts = 1

   " vimprocをビルドする
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif
" dein.vimの設定終了
"---------------------------------

"-------------------------
" 下記のファイルを読み込む
"-------------------------
runtime! init/*.vim " 基本設定もろもろ

"--エラー時のメッセージを表示
set shortmess=a
set cmdheight=2

" インサートモードから抜けると自動的にIMEをオフにする
" set iminsert=2

"===============
" vimの便利コマンド
"===============

"--------------------------------
" タブ関連
"--------------------------------
" 新規タブ           | :tabnew  |
" 次のタブに切り替え | gt       |
" 前のタブに切り替え | gT       |
"--------------------------------

"------------------------------------------------------
" Unite.vim
"------------------------------------------------------
" タブ一覧                       | :Unite tab         |
" 現在のタブで開いたバッファ一覧 | :Unite buffer_tab  |
" バッファ一覧                   | :Unite buffer      |
"------------------------------------------------------

