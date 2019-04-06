" This auto-install VimPlug if it DNE

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins (VimPlug)

call plug#begin()

Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'rstacruz/vim-closer'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'fatih/vim-go'

call plug#end()

" Vim Settings
set laststatus=2

" Force True Color (for TMUX)
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
set backspace=indent,eol,start
let ayucolor="dark"
colorscheme ayu

" Clear sign column highlighting
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Line Numbers
set nu
set cursorline

" Tabs
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.et autoindent

set completeopt-=preview
set clipboard=unnamed
set signcolumn=yes
set nocursorline
set cc=100
set noshowmode

syntax sync minlines=256
syntax on

" Diff splitting
set diffopt+=vertical

" Plugin Settings

let g:enable_bold_font = 1
let g:enable_italic_font = 1

let g:tmuxline_powerline_separators = 0

" ALE Settings
let g:ale_cache_executable_check_failures = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

let g:lightline = {
      \ 'colorscheme': 'one'
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
let g:lightline.active = {
      \     'left': [[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
      \     'right': [['lineinfo'], ['percent'], ['filetype'], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
      \ }
let g:lightline.component_function = {
      \     'gitbranch': 'fugitive#head'
      \ }

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Language Options
let g:go_highlight_trailing_whitespace_error=0

" Timestamps
nnoremap <leader>t <esc>:call TimeStamp()<CR>
function! TimeStamp()
     let l:current_time = strftime("%H:%M:%S")
     execute "normal! 0i\<SPACE>\<ESC>0dwi\
          \<C-R>=l:current_time\<CR>\<CR>"

endfunction
