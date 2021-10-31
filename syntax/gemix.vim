" Language: Gemix language
" Original Author: Luis Panadero Guardeño
" Latest Revision: 28-10-2021
" URL:              https://github.com/Zardoz89/vim-div

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Read the DIV 2/3 syntax to start with
runtime! syntax/div3.vim
unlet b:current_syntax

syntax case ignore

" Keywords
syn keyword gemixHeaderStatement_ include
syn cluster divHeaderStatement contains=divHeaderStatement_,gemixHeaderStatement_
syn keyword gemixTypeDefDeclaration     typedef contained
syn keyword gemixDeclareDeclaration     declare contained
syn keyword gemixConditional elseif
syn keyword gemixMethodsBlockDeclaration methods contained
syn keyword gemixMethodDeclaration method contained
syn keyword gemixCallbackDeclaration callback
syn keyword gemixPublicDeclaration public contained
syn keyword gemixStatement alias
syn keyword gemixTypeBlockDeclaration type contained
syn keyword divFunction function skipwhite skipempty nextgroup=@divTypes,divIdentifier contained

" Numbers

syn match gemixNumber "\d\+\(u\=l\{0,1}\|f\)\>" display
syn match gemixNumber "\v<\d+\.\d+>" display
syn match gemixNumber "\v<\d*\.?\d+([Ee]-?)?\d+>" display
syn cluster divNumbers contains=divNumber,gemixNumber

" Types and declarations
syn keyword gemixType uint float double long bool signed unsigned fobject void
syn keyword gemixType int8 int16 int32 int64 uint8 uint16 uint32 uint64
syn keyword gemixType sbyte dword short
syn keyword gemixType render_entity iregion3D
syn cluster divTypes contains=divType,gemixType

" Special
syn keyword gemixSpecial _use_cstyle _use_cstyle_matrix _use_cstyle_conditions _use_cstyle_operators _use_cstyle_sizeof
syn keyword gemixSpecial _use_always_int2string_conversions

" Funtions
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList dup keydown rgb
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList mode_set mode_get_width mode_get_height mode_get_renderer mode_get_filter mode_set_renderer mode_change mode_set_filter
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList desktop_get_size virtualresolution_set
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList screen_set_color ground_put
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList graphicloader_set_behaviour
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList fpg_load fpg_unload
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList fnt_load fnt_unload fnt_set_color text_move
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList map_load map_unload
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList song_load song_unload audio_refresh_setup song_play songchannel_set_time songchannel_get_time
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList songchannel_pause songchannel_resume songchannel_stop songchannel_mute songchannel_unmute songchannel_fade songchannel_fade_in songchannel_fade_out
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList songchannel_get_loop songchannel_get_loopcount songchannel_get_speed songchannel_get_volume songchannel_get_pan
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList songchannel_set_loop songchannel_set_loopcount songchannel_set_volume songchannel_set_speed songchannel_set_pan
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList load_sound unload_sound sound_load sound_unload
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList text_delete render_text render_graphic
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList logger_set_status logget_set_target logger_get_targetfile logger_is_enabled logger_log logger_set_target
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList memory_new memory_delete
syn keyword gemixFunctions_ skipwhite nextgroup=divParamsList ui32toa
syn cluster divFunctions contains=divFunctions_,gemixFunctions_

" Constants

" Redefined regions & Gemix syntax regions
syn region divConstRootBlock start="^\<const\>"
      \ end="^\ze\<begin\>" end="^\ze\<declare\>" end="^\ze\<typedef\>" end="^\ze\<private\>" end="^\ze\<local\>"
      \ end="^\ze\<global\>" end="^\ze\<process\>" end="^\ze\<function\>" transparent fold keepend
      \ contains=divConstDeclaration,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region divGlobalRootBlock start="^\<global\>"
      \ end="^\ze\<begin\>" end="^\ze\<declare\>" end="^\ze\<typedef\>" end="^\ze\<private\>" end="^\ze\<local\>"
      \ end="^\ze\<process\>" end="^\ze\<function\>" transparent fold keepend
      \ contains=divGlobalDeclaration,divStruct,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region divLocalRootBlock start="^\<local\>"
      \ end="^\ze\<begin\>" end="^\<declare\>" end="^\ze\<typedef\>" end="^\ze\<private\>" end="^\ze\<global\>"
      \ end="^\ze\<process\>" end="^\ze\<function\>" transparent fold keepend
      \ contains=divLocalDeclaration,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region gemixDeclareRootBlock start="^\<declare\>"
      \ end="^\ze\<begin\>" end="^\ze\<private\>" end="^\ze\<global\>" end="^\ze\<local\>" end="^\ze\<typedef\>"
      \ end="^\ze\<process\>" end="^\ze\<function\>" transparent fold keepend
      \ contains=gemixDeclareDeclaration,gemixMethodsBlockDeclaration,gemixMethodDeclaration,gemixPublicDeclaration,divPrivateDeclaration,gemixCallbackDeclaration,@divTypes,divEnd,divIdentifier,@divComments

syn region gemixTypdefRootBlock start="^\<typedef\>"
      \ end="^\ze\<begin\>" end="^\ze\<private\>" end="^\ze\<global\>" end="^\ze\<local\>" end="^\ze\<declare\>"
      \ end="^\ze\<process\>" end="^\ze\<function\>" transparent fold keepend
      \ contains=gemixTypeDefDeclaration,gemixTypeBlockDeclaration,@divTypes,divEnd,divIdentifier,@divComments


syn region divFunctionBlock start="^\<function\>"
      \ end="^\<end\>" transparent fold keepend
      \ contains=@divTypes,divFunction,divDecParamsList,divPrivateBlock,divBeginEndBlock

syn region gemixPublicBlock start="^\<public\>"
      \ end="^\ze\<begin\>" end="^\ze\<methods\>" end="^\ze\<private\>" transparent fold keepend contained
      \ contains=gemixPublicDeclaration,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments
      \ skipwhite skipempty nextgroup=gemixMethodsBlock,divPrivateBlock,divBeginEndBlock

syn region divPrivateBlock start="^\<private\>"
      \ end="^\ze\<begin\>" end="^\ze\<methods\>" end="^\ze\<public\>" transparent fold keepend contained
      \ contains=divPrivateDeclaration,divStruct,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments
      \ skipwhite skipempty nextgroup=gemixMethodsBlock,gemixPublicBlock,divBeginEndBlock

syn region gemixMethodsBlock start="^\<methods\>"
      \ end="^\ze\<begin\>" end="^\ze\<private\>" end="^\ze\<public\>" transparent fold keepend contained
      \ contains=gemixMethodsBlockDeclaration,@divNumbers,divString,@divTypes,@divComments
      \ skipwhite skipempty nextgroup=gemixPublicBlock,divPrivateBlock,divBeginEndBlock

syn region divProcessBlock start="^\<process\>" end="^\<end\>" transparent fold keepend
      \ contains=divProcess,divDecParamsList,gemixPublicBlock,divPrivateBlock,gemixMethodsBlock,divBeginEndBlock



syn region divDecParamsList start="(" end=")" skip="//" transparent contained
      \ contains=@divTypes,divIdentifier,divAssignament,gemixPublicDeclaration,@divNumbers,@divComments


" Highlighting
hi def link gemixConditional          Conditional
hi def link gemixHeaderStatement      Statement
hi def link gemixMethodDeclaration    Statement
hi def link gemixNumber               Number
hi def link gemixType                 Type

hi def link gemixSpecial              Special
hi def link gemixFunctions_           Function
hi def link gemixDeclareDeclaration   Keyword
hi def link gemixTypeDefDeclaration   Keyword
hi def link gemixMethodsBlockDeclaration  Keyword
hi def link gemixTypeBlockDeclaration Structure
hi def link gemixCallbackDeclaration  Keyword
hi def link gemixPublicDeclaration    Keyword


hi def link gemixBlockDeclaration     Statement

let b:current_syntax = "gemix"

" vim: set ts=2 sw=2 tw=78 et :
