" This auto-install VimPlug if it DNE

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins (VimPlug)

call plug#begin()

Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'djoshea/vim-autoread'
Plug 'craigemery/vim-autotag'
Plug 'justinmk/vim-sneak'

Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'dirn/Stone.vim'

call plug#end()

" Vim Settings
set laststatus=2
set termguicolors
set background=dark
set backspace=indent,eol,start
colorscheme ayu

" Clear sign column highlighting
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Line Numbers
set nu
set cursorline
set signcolumn=yes
set nocursorline

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
set nobackup noswapfile
set incsearch
set tags=./tags;,tags;
set cc=100

syntax sync minlines=256
syntax on

" Diff splitting
set diffopt+=vertical

" Plugin Settings
let g:enable_bold_font = 1
let g:enable_italic_font = 1

" ALE Settings
let g:ale_cache_executable_check_failures = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

let g:autotagTagsFile="./tags"

let g:sneak#label = 1
let g:sneak#s_next = 1

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" Language Options
let g:go_highlight_trailing_whitespace_error = 0

" Bindings
nnoremap <leader>t <esc>:call TimeStamp()<CR>
nnoremap <C-p> :Files<Cr>
nnoremap <C-I> :Tags<Cr>
nnoremap <C-_> :Buffers<Cr>

" Functions
function! TimeStamp()
     let l:current_time = strftime("%H:%M:%S")
     execute "normal! 0i\<SPACE>\<ESC>0dwi\
          \<C-R>=l:current_time\<CR>\<CR>"

endfunction
