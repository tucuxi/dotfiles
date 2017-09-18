" Load plugins from ~/.vim/bundle
call pathogen#infect()

syntax enable
filetype indent plugin on
set nocompatible
set tabstop=4
" set expandtab
set cursorline
set incsearch
set foldenable
set path+=**
set wildmenu
set relativenumber
let mapleader=","

" Solarized colors on Mac
if has("unix")
  set background=dark
  colorscheme solarized
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
endif

" Syntastic plugin - syntax checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
