let g:ale_linters = {
\   'javascript': ['eslint', 'eslint-plugin-vue'],
\   'python': ['pyflakes', 'pep8'],
\   'ruby': ['rubocop'],
\   'tex': ['textlint'],
\   'markdown': ['textlint'],
\   'css': ['csslint'],
\}

let g:ale_statusline_format = ['E%d', 'W%d', 'ok']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)
