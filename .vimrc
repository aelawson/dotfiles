" This auto-install VimPlug if it DNE

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins (VimPlug)

call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'

Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'chr4/nginx.vim'
Plug 'dirn/Stone.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Vim Settings
set encoding=UTF-8
set laststatus=2
set termguicolors
set background=dark
set guifont=FiraCode_Nerd_Font:h12
colorscheme ayu
let ayucolor="mirage"

" Lines and Columns
set nu
set cursorline
set signcolumn=yes
set nocursorline
set noshowcmd
set noshowmode

set completeopt-=preview
set clipboard=unnamed
set nobackup noswapfile
set incsearch
set updatetime=300
set nottimeout

syntax sync minlines=256
syntax on

" Diff splitting
set diffopt+=vertical

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

source ~/.vim/coc.vim
source ~/.vim/lightline.vim
source ~/.vim/bindings.vim

" Plugin Settings
let g:enable_bold_font = 1
let g:enable_italic_font = 1

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" Language Options
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_metalinter_autosave = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_gopls_staticcheck = 0
let g:go_def_mapping_enabled = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"

" Indents
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

let g:pyindent_open_paren = 'shiftwidth() * 2'
let g:pyindent_nested_paren = 'shiftwidth()'
let g:pyindent_continue = 'shiftwidth() * 2'

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" NerdTree
map <C-e> :NERDTreeToggle<CR>
