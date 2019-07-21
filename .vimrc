" This auto-install VimPlug if it DNE

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins (VimPlug)

call plug#begin()

" Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'djoshea/vim-autoread'
Plug 'craigemery/vim-autotag'
Plug 'junegunn/goyo.vim'

Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'dirn/Stone.vim'

Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Vim Settings
set laststatus=2
set termguicolors
set background=dark
set backspace=indent,eol,start
set shortmess=aFc
colorscheme onedark

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

autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript.tsx

" Colors
highlight Normal guibg=#21242a
highlight MatchParen guifg=#C678DD guibg=#504066
highlight LineNr    guifg=#383d47
highlight CursorLineNr guifg=#56B6C2
highlight Error guifg=#f57373 guibg=#804040
highlight vimError guifg=#f57373 guibg=#804040

hi String guifg=#98C379 guibg=#2a2e34
" hi Comment cterm=italic

" hi IndentGuidesEven guibg=#21242a guifg=#1f1f28
" hi IndentGuidesOdd guibg=#262a36 guifg=#1f1f28

" Browns
" function params: numbers and constants
hi Statement guifg=#907161
hi Conditional guifg=#907161
hi Keyword guifg=#56B6C2
hi Function guifg=#56B6C2

" Yellows
hi Number guifg=#E5C07B
hi Special guifg=#E5C07B
hi Boolean guifg=#E5C07B

" Purples
hi CtrlPMatch guifg=#ba9ef7
hi Visual guibg=#364652

" medium red: if else operators
hi Preproc guifg=#e86868
hi Type guifg=#e86868

"""""" vim-jsx ONLY
hi Identifier cterm=italic

" Blues
" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5

" dark blues
hi xmlEndTag guifg=#2974a1
hi jsxCloseString guifg=#2974a1
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi jsxAttrib guifg=#1BD1C1

" cyan
hi Constant guifg=#56B6C2
hi typescriptBraces guifg=#56B6C2
hi typescriptEndColons guifg=#56B6C2
hi typescriptRef guifg=#56B6C2
hi typescriptPropietaryMethods guifg=#56B6C2
hi typescriptEventListenerMethods guifg=#56B6C2
hi typescriptFunction guifg=#56B6C2
hi typescriptVars guifg=#56B6C2
hi typescriptParen guifg=#56B6C2
hi typescriptDotNotation guifg=#56B6C2
hi typescriptBracket guifg=#56B6C2
hi typescriptBlock guifg=#56B6C2
hi typescriptJFunctions guifg=#56B6C2
hi typescriptSFunctions guifg=#56B6C2
hi typescriptInterpolationDelimiter guifg=#56B6C2
hi typescriptIdentifier guifg=#907161 cterm=italic

" javascript
hi jsParens guifg=#56B6C2
hi jsObjectBraces guifg=#C678DD
hi jsFuncBraces guifg=#56B6C2
hi jsObjectFuncName guifg=#D19A66
hi jsObjectKey guifg=#56B6C2

" Plugin Settings
let g:enable_bold_font = 1
let g:enable_italic_font = 1

" ALE Settings
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_cache_executable_check_failures = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_fixers = {'typescript': ['tslint']}

let g:autotagTagsFile="./tags"

let g:sneak#label = 1
let g:sneak#s_next = 1

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'oneNeon_lightline',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode',
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }
let g:lightline.enable = {
\   'tabline': 1
\ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '♤ ' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:f') ? expand('%:f') : '[New File]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" NORMAL / INSERT / VISUAL
function! LightlineMode()
  return winwidth(0) > 40 ? lightline#mode() : ''
endfunction

" javascript.jsx
function! LightlineFiletype()
  return winwidth(0) > 100 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" utf-8
function! LightlineFileencoding()
  return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" unix
function! LightlineFileformat()
  return winwidth(0) > 120 ? &fileformat : ''
endfunction

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
