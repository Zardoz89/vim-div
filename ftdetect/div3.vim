" By default we asume that I'ts a Gemix Studio source coude
autocmd BufRead,BufNewFile *.[pP][rR][gG] set filetype=gemix
" If not contains anyone of Gemix keywords, we could assume that it's DIV2/3
" source code
autocmd BufRead,BufNewFile *.[pP][rR][gG] if !search('gemix\|\_use_cstyle\|\include\|\typedef\|\declare\|\methods\|\callback\|\keydown\|\u\?int8\|\u\?int16\|\u\?int32\|\u\?int64\|\float\|\double', 'nw') | set filetype=div3 | endif

" Try to auto set encoding for working with old 8bit encodings
function! CheckFileEncoding()
  if exists('b:fenc_at_read') && &fileencoding != b:fenc_at_read
    exec 'e! ++enc=' . &fileencoding
    unlet b:fenc_at_read
  endif
endfunction
autocmd BufRead     *.[pP][rR][gG] let b:fenc_at_read=&fileencoding
autocmd BufWinEnter *.[pP][rR][gG] call CheckFileEncoding()


