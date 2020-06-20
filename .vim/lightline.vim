let g:lightline = {
    \ 'colorscheme': 'ayu',
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
