if &compatible
  set nocompatible
endif

"reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

if has('nvim')
  let s:dein_cache_path = expand('~/cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path
                 \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim-3/bin/python'

syntax enable

runtime! option.rc.vim
runtime! keymap.rc.vim

if (has("termguicolors"))
 set termguicolors
endif

colorscheme tender
