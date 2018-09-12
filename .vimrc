" Load plugins using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" Plug 'vim-syntastic/syntastic'
Plug 'lervag/vimtex'
call plug#end()

set nocompatible
syntax enable
filetype plugin indent on

" Search subdirectories
set path+=**

" Display all matching files with tab complete
set wildmenu

set nojoinspaces
set expandtab
set shiftwidth=2
set autoindent
set cursorline
set number
set relativenumber
set foldenable
set foldmethod=marker
set ignorecase
set incsearch

" Delete trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Dealing with long lines (see *25.4*)
set linebreak
set display+=lastline
map <Up> gk
map <Down> gj

" Redefine key combinations that suck on German keyboard
nnoremap ü <C-]>
nnoremap ö [
nnoremap ä ]

let mapleader=","
let maplocalleader=","

" PLugin vim-colors-solarized
set background=dark
colorscheme solarized
" let g:solarized_termtrans=1

" Plugin vim-airline
let g:airline_powerline_fonts=0

" Plugin vim-airline-themes
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Plugin syntastic -- syntax checker
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" let g:syntastic_tex_checkers=['chktex']

" Plugin vimtex -- LaTeX integration
" let g:vimtex_compiler_latexmk = {'callback' : 0, 'options' : ['-lualatex',],}
