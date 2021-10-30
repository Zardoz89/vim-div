" Language:    DIV2 & DIV DX 3.0; Gemix Studio
" Maintainer:  Luis Panadero Guardeño
" Last Change: 30-10-2021
" URL:         https://github.com/Zardoz89/vim-div

" By default we asume that I'ts a Gemix Studio source coude
autocmd BufRead,BufNewFile *.[pP][rR][gG] set filetype=gemix

" If not contains anyone of Gemix keywords, we could assume that it's DIV2/3 source code
let g:gemix_always = get(g:, 'gemix_always', 0)
if !gemix_always
  let g:gemix_detect_keywords = get(g:, 'gemix\|\_use_cstyle\|\include\|\typedef\|\declare\|\methods\|\callback\|\keydown\|\u\?int8\|\u\?int16\|\u\?int32\|\u\?int64\|\float\|\double', 0)
  autocmd BufRead,BufNewFile *.[pP][rR][gG] if !search(g:gemix_detect_keywords, 'nw') | set filetype=div3 | endif
endif

" Try to auto set encoding for working with old 8bit encodings
function! CheckFileEncoding()
  if exists('b:fenc_at_read') && &fileencoding != b:fenc_at_read
    exec 'e! ++enc=' . &fileencoding
    unlet b:fenc_at_read
  endif
endfunction
autocmd BufRead     *.[pP][rR][gG] let b:fenc_at_read=&fileencoding
autocmd BufWinEnter *.[pP][rR][gG] call CheckFileEncoding()

autocmd FileType gemix compiler gemix


" vim: set ts=2 sw=2 tw=78 et :
