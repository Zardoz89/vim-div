" DIV 2 and DIV DX 3.0 Syntax Highlighting for Vim
" Vim syntax file
" Language: DIV2 and DIV DX 3 language
" Original Author: Casper van Beuzekom
" Maintainer: Luis Panadero Guardeño
" Latest Revision: 10-10-2020

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword divHeaderStatement compiler_options program import setup_program
syn keyword divHeaderStatement COMPILER_OPTIONS PROGRAM IMPORT SETUP_PROGRAM
syn keyword divConditional if else switch case
syn keyword divConditional IF ELSE SWITCH CASE
syn keyword divRepeat do for do repeat while to until loop step
syn keyword divRepeat DO FOR DO REPEAT WHILE TO UNTIL LOOP STEP
syn keyword divBlockDeclaration const global local private
syn keyword divBlockDeclaration CONST GLOBAL LOCAL PRIVATE
syn keyword divStatement process function
syn keyword divStatement PROCESS FUNCTION
syn keyword divStatement break return continue
syn keyword divStatement BREAK RETURN CONTINUE
syn keyword divStatement offset pointer sizeof
syn keyword divStatement OFFSET POINTER SIZEOF
syn keyword divStruct struct
syn keyword divStruct STRUCT

syn keyword div3Keywords begin end frame from clone debug case
syn keyword div3Keywords BEGIN END FRAME FROM CLONE DEBUG CASE

" Comments
syn keyword div3TodoComment contained TODO FIXME TBD NOTE
syn region div3Comment start=/\/\// end=/$/ contains=div3TodoComment,@Spell extend keepend
syn region div3Comment start=/\/\*/ end=/\*\// contains=div3TodoComment,@Spell extend keepend

" Strings
syn region div3String start=+"+ skip=+\\\("\|$\)+ end=+"\|$+

" Numbers and booleans
syn keyword divBoolean true false
syn match div3Number /\<\d\+\%([eE][+-]\=\d\+\)\=\>\|\<0[bB][01]\+\>\|\<0[oO]\o\+\>\|\<0[xX]\x\+\>/

" Operators
"   match single-char operators:  - + % < > ! & | ^ * =
syn match divMathOperator /[-+%<>!&|^*=]/
syn match divLogicOperator  "&&\|||" "\|or\|xor\|and\|neg

" Types and declarations
syn keyword divType byte int word string
syn keyword divType BYTE INT WORD STRING

" Special
syn keyword div3Special _max_process _extended_conditions _simple_conditions _case_sensitive _ignore_errors _free_syntax _no_strfix _no_optimization _no_range_check _no_id_check _no_null_check _no_check

" Commands
syn keyword div3Commands collision get_angle get_dist get_distx get_disty get_id let_me_alone signal advance fget_angle fget_dist near_angle xadvance path_find path_free path_line abs acos asin atan atan2 cos pow sin sqrt tan rand rand_seed clear_screen get_pixel map_block_copy map_get_pixel map_put map_put_pixel map_xput new_map put put_pixel put_screen screen_copy xput delete_draw draw move_draw change_channel change_sound reset_sound set_volume is_playing_sound load_pcm load_wav sound stop_sound unload_pcm unload_wav is_playing_cd play_cd stop_cd get_song_line get_song_pos is_playing_song load_song set_song_pos song stop_song unload_song get_joy_button get_joy_position key convert_palette fade fade_off fade_on find_color force_pal load_pal roll_palette set_color move_scroll refresh_scroll start_mode7 start_scroll stop_mode7 stop_scroll get_point_m8 get_sector_height get_sector_texture get_wall_texture go_to_flag load_wld set_env_color set_fog set_point_m8 set_sector_height set_sector_texture set_wall_texture start_mode8 stop_mode8 delete_text load_fnt move_text write unload_fnt write_int write_in_map char lower strcat strchr strcmp strcpy strdel strlen strset strstr upper calculate itoa end_fli frame_fli reset_fli start_fli define_region out_region get_point get_real_point graphic_info set_fps set_mode load_fpg load_map load_pcx unload_fpg unload_map unload_pcx save_map save_pcx load save fclose filelength flush fopen fread fseek ftell fwrite chdir disk_free get_dirinfo get_fileinfo getdrive mkdir remove setdrive compress_file uncompress_file decode_file encode encode_file exit ignore_error system free malloc memory_free net_get_games net_join_game load_sound

" Constants
syn keyword divConstants m320x200 m320x240 m320x400 m360x240 m360x360 m376x282 m640x400 m640x480 m800x600 m1024x768
syn keyword divConstants min_int max_int pi
syn keyword divConstants s_kill s_wakeup s_sleep s_freeze s_kill_tree s_wakeup_tree s_sleep_tree s_freeze_tree 
syn keyword divConstants all_text all_drawing all_sound 
syn keyword divConstants g_wide g_height g_x_center g_y_center c_screen c_scroll c_m7 c_m8 
syn keyword divConstants partial_dump complete_dump no_restore partial_restore complete_restore 
syn keyword divConstants c_0 c_1 c_2 c_3 c_4 c_5 c_6 c_7 c_8 c_9 
syn keyword divConstants _max_process _extended_conditions _simple_conditions _case_sensitive _ignore_errors _free_sintax _no_check _no_strfix _no_optimization _no_range_check _no_id_check _no_null_check
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

" Highlighting
let b:current_syntax = "div3"

hi def link divBoolean                Boolean
hi def link div3Comment               Comment
hi def link div3String                String
hi def link divConditional            Conditional
hi def link div3Number                Number
hi def link divRepeat                 Repeat
hi def link divHeaderStatement        Statement
hi def link divStatement              Statement
hi def link div3Keywords              Statement
hi def link divStruct                 Statement
hi def link divMathOperator           Operator
hi def link divLogicOperator          Operator
hi def link div3TodoComment           Todo
hi def link divType                   Type

hi def link div3Special               PreProc
hi def link div3Commands              Function
hi def link divConstants              Constants
hi def link divBlockDeclaration       Statement


" WIP
" Expression
"syntax cluster div3Expression contains=div3Keywords,div3Comment,div3TodoComment,div3String,div3Number,div3Operator
"
" Operators
"syntax match div3Operator /[\!\|\&\+\-\<\>\=\%\/\*\~\^]\{1}/ skipwhite skipempty nextgroup=@div3Expression
" match /
"syntax match div3Operator /[/]/
