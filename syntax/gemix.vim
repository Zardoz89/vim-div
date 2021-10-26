" Gemix Syntax Highlighting for Vim
" Vim syntax file
" Language: Gemix language
" Original Author: Casper van Beuzekom
" Original Author: Luis Panadero Guardeño
" Latest Revision: 26-10-2021

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Read the Cdiv2/3 syntax to start with
runtime! syntax/div3.vim
unlet b:current_syntax

syntax case ignore

" Keywords
syn keyword gemixHeaderStatement include
syn keyword gemixHeaderStatement typedef declare
syn keyword gemixConditional elseif
syn keyword gemixBlockDeclaration public private callback methods
syn keyword gemixStatement method alias
syn keyword gemixTypeDef type


" DIV Only supports integers numbers

syn match gemixNumber "\d\+\(u\=l\{0,1}\|f\)\>" display
syn match gemixNumber "\v<\d+\.\d+>" display
syn match gemixNumber "\v<\d*\.?\d+([Ee]-?)?\d+>" display

" Types and declarations
syn keyword gemixType uint float double long bool signed unsigned fobject void
syn keyword gemixType int8 int16 int32 int64 uint8 uint16 uint32 uint64

" Special
syn keyword gemixSpecial _use_cstyle _use_cstyle_matrix _use_cstyle_conditions _use_cstyle_operators _use_cstyle_sizeof
syn keyword gemixSpecial _use_always_int2string_conversions

" Funtions
syn keyword gemixFunction dup keydown

" Constants

" Highlighting
hi def link gemixConditional          Conditional
hi def link gemixHeaderStatement      Statement
hi def link gemixStatement            Statement
hi def link gemixTypeDef              Structure
hi def link gemixNumber               Number
hi def link gemixType                 Type

hi def link gemixSpecial              Special
hi def link gemixFunction             Function

hi def link gemixBlockDeclaration     Statement

let b:current_syntax = "gemix"

" vim: set ts=2 sw=2 tw=78 et :
