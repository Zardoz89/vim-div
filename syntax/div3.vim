" Language:         DIV2 & DIV DX 3.0
" Original Author:  Casper van Beuzekom
" Maintainer:       Luis Panadero Guardeño
" Latest Revision:  28-10-2021
" URL:              https://github.com/Zardoz89/vim-div

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syntax case ignore
" Fix the problem with long comments and regions
syntax sync fromstart ccomment divComment

" Comments
syntax case match
syn keyword divTodoComment contained TODO FIXME TBD NOTE

syntax case ignore
syn region divLineComment start="//" end="$" contains=divTodoComment,@Spell keepend
syn region divComment start="/\*"  end="\*/"  contains=divTodoComment,@Spell
syn cluster divComments contains=divLineComment,divComment

" Strings
syn region divString matchgroup=divString start=+"+ end=+"+ skip="//" oneline

" ** Regions **

syn region divConstRootBlock start="^\<const\>"
      \ end="^\ze\<begin\>" end="^\ze\<private\>" end="^\ze\<local\>" end="^\ze\<global\>" transparent fold keepend
      \ contains=divConstDeclaration,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region divGlobalRootBlock start="^\<global\>"
      \ end="^\ze\<begin\>" end="^\ze\<private\>" end="^\ze\<local\>" transparent fold keepend
      \ contains=divGlobalDeclaration,divStruct,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region divLocalRootBlock start="^\<local\>"
      \ end="^\ze\<begin\>" end="^\ze\<private\>" end="^\ze\<global\>" transparent fold keepend
      \ contains=divLocalDeclaration,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region divPrivateRootBlock start="^\<private\>"
      \ end="^\ze\<begin\>" transparent fold keepend
      \ contains=divPrivateDeclaration,divStruct,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments

syn region divBeginEndRootBlock start="^\<begin\>"
      \ end="^\<end\>" transparent fold keepend
      \ contains=ALLBUT,@divHeaderStatement,@divRootBlocks,divDecParamsList

syn cluster divRootBlocks
      \ contains=divConstRootBlock,divGlobalDeclaration,divLocalDeclaration,divPrivateBlock,divBeginEndRootBlock,divFunctionBlock,divProcessBlock


syn region divFunctionBlock start="^\<function\>"
      \ end="^\<end\>" transparent fold keepend
      \ contains=divFunction,divDecParamsList,divPrivateBlock,divBeginEndBlock

syn region divPrivateBlock start="^\<private\>"
      \ end="^\ze\<begin\>" transparent fold keepend contained
      \ contains=divPrivateDeclaration,divStruct,@divTypes,divIdentifier,divAssignament,@divOperators,@divNumbers,divString,@divComments
      \ skipwhite skipempty nextgroup=divBeginEndBlock

syn region divBeginEndBlock start="^\<begin\>" end="^\<end\>" transparent fold keepend contained
      \ contains=ALLBUT,@divHeaderStatement,@divRootBlocks,divDecParamsList

syn region divProcessBlock start="^\<process\>" end="^\<end\>" transparent fold keepend
      \ contains=divProcess,divDecParamsList,divPrivateBlock,divBeginEndBlock


syn region divDecParamsList start="(" end=")" skip="//" transparent contained
      \ contains=@divTypes,divIdentifier,@divComments

syn region divParamsList start="(" end=")" skip="//" transparent contained
      \ contains=divParamsList,divConstants,@divFunctions,divIdentifier,divString,@divNumbers,@divOperators,@divComments

" Keywords
syn keyword divHeaderStatement_ compiler_options program import setup_program
syn cluster divHeaderStatement contains=divHeaderStatement_
syn keyword divConditional if else switch case
syn keyword divRepeat do for do repeat while to until loop step
syn keyword divConstDeclaration     const contained
syn keyword divGlobalDeclaration    global contained
syn keyword divLocalDeclaration     local contained
syn keyword divPrivateDeclaration   private contained
syn keyword divBegin begin contained
syn keyword divEnd end contained
syn keyword divProcess process skipwhite skipempty nextgroup=divIdentifier contained
syn keyword divFunction function skipwhite skipempty nextgroup=divIdentifier contained
syn keyword divStatement break return continue
syn keyword divStruct struct
syn keyword divKeywords frame from clone

syn keyword divDebug debug


" Numbers and booleans
syn keyword divBoolean true false

" DIV Only supports integers numbers
syn match divNumber "\v<\d+>" display
syn cluster divNumbers contains=divNumber

" Operators
syn match divAssignament        "=" "display contained contains=NONE
syn keyword divPointerOperator  offset pointer
syn match divMathOperator       "[-+%<>!&|^*=]" display contained contains=NONE
syn match divEqualsOperator     "==" display contained contains=NONE
syn match divLogicOperator      "&&\|||"  display contained contains=NONE
syn match divLogicOperator      "not\|or\|xor\|and\|neg" display contained contains=NONE

syn cluster divOperators contains=divPointerOperator,divEqualsOperator,divMathOperator,divLogicOperator

" Types and declarations
syn keyword divType byte int word string
syn cluster divTypes contains=divType

" Special
syn keyword divSpecial _max_process _extended_conditions _simple_conditions
syn keyword divSpecial _case_sensitive _ignore_errors _free_syntax
syn keyword divSpecial _no_strfix _no_optimization 
syn keyword divSpecial _no_check _no_range_check _no_id_check _no_null_check

" Functions
syn keyword divFunctions_ skipwhite nextgroup=divParamsList sizeof frame
syn keyword divFunctions_ skipwhite nextgroup=divParamsList signal key load_pal load_fpg start_scroll stop_scroll out_region
syn keyword divFunctions_ skipwhite nextgroup=divParamsList graphic_info collision get_id get_distx get_disty get_angle get_dist fade
syn keyword divFunctions_ skipwhite nextgroup=divParamsList load_fnt write write_int delete_text move_text unload_fpg rand define_region
syn keyword divFunctions_ skipwhite nextgroup=divParamsList xput put put_screen map_xput map_put put_pixel get_pixel map_put_pixel
syn keyword divFunctions_ skipwhite nextgroup=divParamsList map_get_pixel get_point clear_screen save load set_mode load_pcm unload_pcm
syn keyword divFunctions_ skipwhite nextgroup=divParamsList sound stop_sound change_sound set_fps start_fli frame_fli end_fli reset_fli
syn keyword divFunctions_ skipwhite nextgroup=divParamsList system refresh_scroll fget_dist fget_angle play_cd stop_cd is_playing_cd
syn keyword divFunctions_ skipwhite nextgroup=divParamsList start_mode7 stop_mode7 advance abs fade_on fade_off rand_seed sqrt pow
syn keyword divFunctions_ skipwhite nextgroup=divParamsList map_block_copy move_scroll near_angle let_me_alone exit roll_palette
syn keyword divFunctions_ skipwhite nextgroup=divParamsList get_real_point get_joy_button get_joy_position convert_palette load_map
syn keyword divFunctions_ skipwhite nextgroup=divParamsList reset_sound unload_map unload_fnt set_volume unload_wav load_wav load_pcx
syn keyword divFunctions_ skipwhite nextgroup=divParamsList unload_pcx set_color net_join_game net_get_games stop_mode8 xadvance char
syn keyword divFunctions_ skipwhite nextgroup=divParamsList path_find path_line path_free new_map load_wld start_mode8 go_to_flag
syn keyword divFunctions_ skipwhite nextgroup=divParamsList set_sector_height get_sector_height set_point_m8 get_point_m8 set_fog
syn keyword divFunctions_ skipwhite nextgroup=divParamsList set_sector_texture get_sector_texture set_wall_texture get_wall_texture
syn keyword divFunctions_ skipwhite nextgroup=divParamsList set_env_color strcpy strcat strlen strcmp strchr strstr strset upper lower
syn keyword divFunctions_ skipwhite nextgroup=divParamsList strdel screen_copy qsort load_song unload_song song stop_song set_song_pos
syn keyword divFunctions_ skipwhite nextgroup=divParamsList get_song_pos get_song_line is_playing_sound is_playing_song fopen fclose
syn keyword divFunctions_ skipwhite nextgroup=divParamsList fread fwrite fseek ftell filelength flush get_dirinfo get_fileinfo getdrive
syn keyword divFunctions_ skipwhite nextgroup=divParamsList setdrive chdir mkdir remove disk_free memory_free ignore_error save_pcx
syn keyword divFunctions_ skipwhite nextgroup=divParamsList sin cos tan asin acos atan atan2 draw delete_draw move_draw save_map
syn keyword divFunctions_ skipwhite nextgroup=divParamsList write_in_map calculate itoa change_channel malloc free encode encode_file
syn keyword divFunctions_ skipwhite nextgroup=divParamsList decode_file compress_file uncompress_file find_color load_screen force_pal
syn cluster divFunctions contains=divFunctions_

" Constants
syn keyword divConstants m320x200 m320x240 m320x400 m360x240 m360x360 m376x282 m640x400 m640x480 m800x600 m1024x768
syn keyword divConstants min_int max_int pi
syn keyword divConstants s_kill s_wakeup s_sleep s_freeze s_kill_tree s_wakeup_tree s_sleep_tree s_freeze_tree
syn keyword divConstants all_text all_drawing all_sound
syn keyword divConstants g_wide g_height g_x_center g_y_center c_screen c_scroll c_m7 c_m8
syn keyword divConstants partial_dump complete_dump no_restore partial_restore complete_restore
syn keyword divConstants c_0 c_1 c_2 c_3 c_4 c_5 c_6 c_7 c_8 c_9
syn keyword divConstants seek_set seek_cur seek_end _normal _hidden _system _volid _subdir
syn keyword divConstants fast_mixer quality_mixer sound_bits_8 sound_bits_16 _wave
syn keyword divConstants _esc _f1 _f2 _f3 _f4 _f5 _f6 _f7 _f8 _f9 _f10 _f11 _f12 _prn_scr _scroll_lock
syn keyword divConstants _1 _2 _3 _4 _5 _6 _7 _8 _9 _0 _minus _plus _backspace _tab
syn keyword divConstants _q _w _e _r _t _y _u _i _o _p _l_brachet _r_brachet _enter _caps_lock
syn keyword divConstants _a _s _d _f _g _h _j _k _l _semicolon _apostrophe _backslash _l_shift
syn keyword divConstants _z _x _c _v _b _n _m _comma _point _slash _r_shift _control _alt _space
syn keyword divConstants _ins _home _pgup _del _end _pgdn _up _down _left _right _num_lock
syn keyword divConstants _c_backslash _c_asterisk _c_minus _c_home _c_up _c_pgup
syn keyword divConstants _c_left _c_center _c_right _c_end _c_down _c_pgdn _c_ins _c_del _c_plus _c_enter

" Identifiers
syn match divIdentifier "\<\K\k*\>" contained


" Highlighting
hi def link divBoolean                Boolean
hi def link divLineComment            Comment
hi def link divComment                Comment
hi def link divString                 String
hi def link divConditional            Conditional
hi def link divNumber                 Number
hi def link divRepeat                 Repeat
hi def link divHeaderStatement_       Statement
hi def link divStatement              Statement
hi def link divKeywords               Keyword
hi def link divDebug                  Debug
hi def link divStruct                 Structure
hi def link divAssignament            Delimiter
hi def link divPointerOperator        Operator
hi def link divEqualsOperator         Operator
hi def link divMathOperator           Operator
hi def link divLogicOperator          Operator
hi def link divTodoComment            Todo
hi def link divType                   Type

hi def link divSpecial                Special
hi def link divFunctions_             Function
hi def link divConstants              Constants
hi def link divConstDeclaration       Keyword
hi def link divGlobalDeclaration      Keyword
hi def link divLocalDeclaration       Keyword
hi def link divPrivateDeclaration     Keyword

hi def link divProcess                Keyword
hi def link divFunction               Keyword
hi def link divBegin                  Keyword
hi def link divEnd                    Keyword
hi def link divIdentifier             Identifier


let b:current_syntax = "div3"

" vim: set ts=2 sw=2 tw=78 et :
