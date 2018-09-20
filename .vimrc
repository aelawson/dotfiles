" This auto-install VimPlug if it DNE

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins (VimPlug)

call plug#begin()

Plug 'kristijanhusak/vim-hybrid-material'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'edkolev/tmuxline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" Vim Settings

" Force True Color (for TMUX)
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
set backspace=indent,eol,start
colorscheme hybrid_reverse

" Clear sign column highlighting
highlight clear SignColumn
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Line Numbers
set nu

" Tabs
set ts=2
set sw=2
set expandtab

set completeopt-=preview

set nocursorcolumn
set nocursorline
set norelativenumber
set laststatus=2

syntax sync minlines=256
syntax on

" Plugin Settings

let g:enable_bold_font = 1
let g:enable_italic_font = 1

let g:tmuxline_powerline_separators = 0

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

let g:ale_cache_executable_check_failures = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
