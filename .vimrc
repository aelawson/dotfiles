" This auto-install VimPlug if it DNE

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins (VimPlug)

call plug#begin()

Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'raimondi/delimitmate'
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

" Line Numbers
set nu

" Tabs
set ts=2
set sw=2
set expandtab

syntax on

" Plugin Settings

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:airline_theme = "wombat"
let g:tmuxline_powerline_separators = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ycm_add_preview_to_completeopt = 0
let g:complete_parameter_log_level = 1

" VimComplete Bindings
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
