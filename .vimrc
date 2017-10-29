" Load plugins using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
call plug#end()

syntax enable
filetype plugin indent on
set nocompatible
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
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

" vimtex - LaTeX integration
let g:vimtex_compiler_latexmk = {'callback' : 0}
