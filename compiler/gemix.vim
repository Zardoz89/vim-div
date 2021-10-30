" Compiler:    Gemix Studio, via a makefile
" Maintainer:  Luis Panadero Guardeño
" Last Change: 30-10-2021
" URL:         https://github.com/Zardoz89/vim-div
"
" Uses a makefile to wrap all the weirdness of actually compiling anything with gemix

if exists("current_compiler")
  finish
endif
let current_compiler = "gemix_makefile"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

"filename.prg:LINE:COLUMN: ERROR 9: Expecting ' ; '
CompilerSet errorformat=%f:%l:%c:\ %m

