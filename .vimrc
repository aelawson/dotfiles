" Plugins (vim-plug)

" Auto-Install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Directory for vim-plug plugins
call plug#begin('~/.vim/plug-plugins')

Plug 'tpope/vim-sensible'

" Functionality

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'

" Language

Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'

" Customization

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Settings

set term=xterm-256color
set updatetime=250
set background=dark
set termguicolors
set guifont=Inconsolata
set nu

colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:quantum_italics=1

" GitGutter

set signcolumn=yes

" CtrlP

let g:ctrlp_dont_split = 'nerdtree'

" Key Mappings

map <C-n> :NERDTreeToggle<CR>

" Language Settings

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=119
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

set t_ut=
