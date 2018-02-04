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
set nojoinspaces
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set cursorline
set incsearch
set foldenable
set path+=**
set wildmenu
set number
set relativenumber

" Delete trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Dealing with long lines (see *25.4*)
set linebreak
set display+=lastline
map <Up> gk
map <Down> gj

" Redefine inconvenient keys for German keyboard
nnoremap ü <C-]>

let mapleader=","
let maplocalleader=","

" Solarized color scheme
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" Syntastic plugin - syntax checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_tex_checkers=['chktex']

" vimtex - LaTeX integration
let g:vimtex_compiler_latexmk = {'callback' : 0, 'options' : ['-lualatex',],}
