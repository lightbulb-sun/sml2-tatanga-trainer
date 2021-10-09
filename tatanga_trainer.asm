MAIN_BANK                       equ     29
MAIN_ADDR                       equ     $7680

SPACE_STARTING_POS_BANK         equ     1
SPACE_STARTING_POS_ADDR         equ     $5787

COUNTDOWN                       equ     $ad1c

CUR_ROM_BANK                    equ     $a24e
SELECT_ROM_BANK                 equ     $2100
CUR_LEVEL                       equ     $a269
CUR_GAME_STATE                  equ     $ff9b
CUR_POWERUP                     equ     $a216
NUM_LIVES                       equ     $a22c
BUTTONS_PRESSED                 equ     $ff80
NEW_BUTTON_ACTIVITY             equ     $ff81

BUTTON_START                    equ     $08
BIT_BUTTON_START                equ     $03

UNRESPONSIVENESS_COUNTDOWN_LSB  equ     $a266
UNRESPONSIVENESS_COUNTDOWN_MSB  equ     $a267

STATE_ENTER_LEVEL               equ     $16
POWERUP_FIRE                    equ     $03
GAME_STATE_IN_LEVEL             equ     $04
GAME_STATE_PAUSED               equ     $08

LEVEL_SPACE                     equ     19

NUM_TILES_PER_LINE              equ     $20
FUNC_INIT_STATUS_BAR            equ     $07db
FUNC_UPDATE_STATUS_BAR          equ     $0770
BG2_LINE_1                      equ     $9c00
BG2_LINE_2                      equ     BG2_LINE_1 + NUM_TILES_PER_LINE
BG2_LINE_4                      equ     BG2_LINE_1 + 3*NUM_TILES_PER_LINE
BG2_LINE_5                      equ     BG2_LINE_1 + 4*NUM_TILES_PER_LINE

EMPTY_TILE                      equ     $8a
TILE_B                          equ     $8b
TILE_RIGHT_ARROW                equ     $8e
TILE_FIREBALL                   equ     $8f
TILE_CAPITAL_H                  equ     $90
TILE_LOWER_Z                    equ     $91
TILE_PERIOD                     equ     $92
TILE_SKULL                      equ     $93
TILE_INACTIVE_FIREBALL          equ     $94

TILE_CREDITS_B                  equ     $95
TILE_CREDITS_C                  equ     $96
TILE_CREDITS_D                  equ     $97
TILE_CREDITS_E                  equ     $98
TILE_CREDITS_G                  equ     $99
TILE_CREDITS_L                  equ     $9a
TILE_CREDITS_N                  equ     $9b
TILE_SLASH                      equ     $9c
TILE_CREDITS_DARK_S             equ     $9d
TILE_CREDITS_DARK_H             equ     $9e
TILE_CREDITS_DARK_B             equ     $9f

TILE_X                          equ     $ac

MASK_NON_DIRECTIONAL_BUTTONS    equ     $0f
BUTTONS_A_B_START_SELECT        equ     $0f

RESET_GAME_NEXT                 equ     $029f

STATUS_BAR_Y                    equ     $80
ANALYSIS_SCREEN_Y               equ     $00

BUTTON_RIGHT                    equ     $10
BUTTON_B                        equ     $02

LAST_BGP                        equ     $a80f
LAST_OBP0                       equ     $a810
LAST_OBP1                       equ     $a811
NEXT_BGP                        equ     $a27e
NEXT_OBP0                       equ     $a27f
NEXT_OBP1                       equ     $a280

WY                              equ     $ff4a
WX                              equ     $ff4b

LCDC                            equ     $ff40
OBJ_ON_FLAG                     equ     $02

UNRESPONSIVE_FRAMES             equ     $80

MAX_ANALYSIS_LINES              equ     12


SECTION "variables", SRAM[$a000], BANK[0]
FRAMES_SINCE_LAST_LAUNCH_LSB:           db
FRAMES_SINCE_LAST_LAUNCH_MSB:           db
NEXT_FREE_LINE_POINTER_LSB:             db
NEXT_FREE_LINE_POINTER_MSB:             db
FRAMES_SINCE_GAINED_CONTROL_LSB:        db
FRAMES_SINCE_GAINED_CONTROL_MSB:        db
LAST_FRAMES_SINCE_GAINED_CONTROL_LSB:   db
LAST_FRAMES_SINCE_GAINED_CONTROL_MSB:   db
FRAMES_SINCE_FIRST_B_LSB:               db
FRAMES_SINCE_FIRST_B_MSB:               db
IS_PAUSED:                              db
CUR_FIREBALL:                           db
LAST_COLLISION_FIREBALL_NUMBER:         db
FOUND_COLLISION:                        db
CUR_FREQUENCY:                          db
CUR_FREQUENCY_DECIMAL:                  db
PREV_ROM_BANK:                          db
HAS_ENTERED_ROOM:                       db
HAS_CONTROL:                            db
HAS_PRESSED_RIGHT:                      db
COUNTDOWN_VAL_AT_RIGHT_PRESS:           db
HAS_PRESSED_B:                          db
COUNTDOWN_VAL_AT_B_PRESS:               db
NUM_FIREBALLS_LAUNCHED:                 db
NUM_B_PRESSES:                          db
CUR_INDEX:                              db
REST8:                                  db
CUR_BG2_POINTER_LSB:                    db
CUR_BG2_POINTER_MSB:                    db
CUR_ANALYSIS_SRC_LSB:                   db
CUR_ANALYSIS_SRC_MSB:                   db
CUR_ANALYSIS_DEST_LSB:                  db
CUR_ANALYSIS_DEST_MSB:                  db
FIREBALL_1_IS_ACTIVE:                   db
FIREBALL_2_IS_ACTIVE:                   db
CUR_FIREBALL_1_POINTER_LSB:             db
CUR_FIREBALL_1_POINTER_MSB:             db
CUR_FIREBALL_2_POINTER_LSB:             db
CUR_FIREBALL_2_POINTER_MSB:             db
BOSS_IS_DEAD:                           db
MARIO_IS_DEAD:                          db
TOOK_DAMAGE:                            db
MY_BUTTONS_PRESSED:                     db
MY_NEW_BUTTON_ACTIVITY:                 db
TMP_LSB:                                db
TMP_MSB:                                db
ARRAY:                                  db
debug1:

SECTION "analysis_screen_buffer", SRAM[$a300], BANK[0]
ANALYSIS_SCREEN_BUFFER:         ds 256

DBGMSG: MACRO
        ld  d, d
        jr .end\@
        DW $6464
        DW $0000
        DB \1
.end\@:
        ENDM

ldhl16: MACRO
        ld a, [\1]
        ld l, a
        ld a, [\1+1]
        ld h, a
ENDM

sthl16: MACRO
        ld a, l
        ld [\1], a
        ld a, h
        ld [\1+1], a
ENDM

ldde16: MACRO
        ld a, [\1]
        ld e, a
        ld a, [\1+1]
        ld d, a
ENDM

stde16: MACRO
        ld a, e
        ld [\1], a
        ld a, d
        ld [\1+1], a
ENDM

ldbc16: MACRO
        ld a, [\1]
        ld c, a
        ld a, [\1+1]
        ld b, a
ENDM

stbc16: MACRO
        ld a, c
        ld [\1], a
        ld a, b
        ld [\1+1], a
ENDM

hl2de:  MACRO
        ld a, h
        ld d, a
        ld a, l
        ld e, a
ENDM

de2hl:  MACRO
        ld a, d
        ld h, a
        ld a, e
        ld l, a
ENDM


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION "jumps1", ROM0[$005b]
jump_hub:
                ld      a, [CUR_ROM_BANK]
                ld      [PREV_ROM_BANK], a

                ld      a, MAIN_BANK
                ld      [CUR_ROM_BANK], a
                ld      [SELECT_ROM_BANK], a

                ld      de, .return
                push    de
                jp      hl
.return
                ld      a, [PREV_ROM_BANK]
                ld      [CUR_ROM_BANK], a
                ld      [SELECT_ROM_BANK], a

                ret
                
jump_main:
                ld      hl, main
                call    jump_hub

                ; replace original instruction
                call    $207d

                ret

jump_save_countdown:
                ld      hl, save_countdown
                call    jump_hub

                ; replace original instruction
                ld      a, [$afc5]
                ret

init_boss_room:
                ld      a, 1
                ld      [HAS_ENTERED_ROOM], a

                ; replace original instruction
                call    $25af

                ret

jump_after_button_input:
                ld      hl, after_button_input
                call    jump_hub

                ; replace original instruction
                call    $38b9
                ret

jump_toward_end_of_game_loop:
                ld      hl, toward_end_of_game_loop
                call    jump_hub

                ;replace original instruction
                call    $20a4
                ret

jump_check_fireball_launch:
                push    hl
                ld      a, l
                ld      c, a
                ld      hl, check_fireball_launch
                call    jump_hub

                ; replace original instructions
                pop     hl
                ld      a, $01
                ld      [hl+], a
                ret

jump_taking_damage:
                ld      hl, taking_damage
                call    jump_hub

                ; replace original instruction
                xor     a
                ld      [$a224], a
                ret


jump_paused:
                ld      hl, paused
                call    jump_hub
                ret

restore_start_button:
                ld      a, [NEW_BUTTON_ACTIVITY]
                and     BUTTON_START
                ld      [NEW_BUTTON_ACTIVITY], a
                ld      a, [BUTTONS_PRESSED]
                and     BUTTON_START
                ld      [BUTTONS_PRESSED], a
                ret

jump_tile_copying:
                ld      hl, tile_copying
                call    jump_hub

                ; replace original instruction
                ld      a, [UNRESPONSIVENESS_COUNTDOWN_LSB]
                ret

jump_unresponsiveness_check:
                ld      hl, unresponsiveness_check
                call    jump_hub

                ; replace original instruction
                ld      a, [$a266]
                ret

debug2:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION "protected1", ROM0[$0100]
                nop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION "jumps2", ROM0[$3947]

found_collision:
                ld      a, 1
                ld      [FOUND_COLLISION], a

                ; replace original instruction
                ld      a, [$a246]
                ret

jump_deactivate_fireball:
                pop     hl
                sthl16  TMP_LSB
                ld      hl, deactivate_fireball
                call    jump_hub

                ; replace original instructions
                ldhl16  TMP_LSB ; restore hl
                xor     a
                ld      [hl], a
                ret

jump_missed_fireball:
                push    hl
                ld      a, l
                ld      b, a
                ld      hl, missed_fireball
                call    jump_hub

                ; replace original instructions
                pop     hl
                ld      a, $02
                ld      [$a460], a
                ret

cur_fireball:
                ld      a, l
                ld      [CUR_FIREBALL], a
                xor     a
                ld      [FOUND_COLLISION], a

                ; replace original instructions
                ld      a, [$a25f]
                jp      $3277

collision_fireball_number:
                push    af
                ld      a, [CUR_FIREBALL]
                ld      [LAST_COLLISION_FIREBALL_NUMBER], a

                ; replace original instructions
                pop     af
                ld      [$a246], a
                ret

mario_death:
                ld      a, 1
                ld      [MARIO_IS_DEAD], a
                ret

jump_save_stomp:
                ld      hl, save_stomp
                call    jump_hub

                ; replace original instructions
                ld      a, [$afc5]
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION "protected2", ROM0[$3a00]
                ld      a, $03


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION "jumps3", ROM0[$3fbd]

jump_third_fireball:
.loop
                ld      a, [hl]
                and     a
                jp      z, $32e7
                ld      bc, $10
                add     hl, bc
                ld      a, l
                cp      $a0
                jr      nz, .loop
                ld      hl, third_fireball
                call    jump_hub
                ret
                
debug3:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION "overwrite_jump_main", ROM0[$0261]
overwrite_jump_main:
                call    jump_main

SECTION "overwrite_jump_save_countdown", ROMX[$529f], BANK[2]
overwrite_jump_save_countdown:
                call    jump_save_countdown

SECTION "overwrite_jump_save_stomp", ROMX[$52b7], BANK[2]
overwrite_jump_save_stomp:
                call    jump_save_stomp

SECTION "overwrite_after_button_input", ROM0[$0276]
overwrite_after_button_input:
                call    jump_after_button_input

SECTION "overwrite_toward_end_of_game_loop", ROM0[$28d]
overwrite_toward_end_of_game_loop:
                call    jump_toward_end_of_game_loop

SECTION "overwrite_wy", ROMX[$5d39], BANK[1]
overwrite_wy:
                ld      a, STATUS_BAR_Y

SECTION "overwrite_init_boss_room", ROM0[$2166]
overwrite_init_boss_room:
                call    init_boss_room

SECTION "overwrite_check_fireball_launch", ROM0[$32e7]
overwrite_check_fireball_launch:
                call    jump_check_fireball_launch

SECTION "overwrite_taking_damage", ROM0[$31c3]
overwrite_taking_damage:
                call    jump_taking_damage

SECTION "overwrite_third_fireball", ROM0[$32d9]
overwrite_third_fireball:
                jp      jump_third_fireball

SECTION "overwrite_paused", ROM0[$2756]
overwrite_paused:
                call    jump_paused

SECTION "overwrite_init_statusbar", ROM0[FUNC_INIT_STATUS_BAR]
overwrite_init_statusbar:
                ld      hl, init_statusbar
                call    jump_hub
                ret

SECTION "overwrite_update_statusbar", ROM0[FUNC_UPDATE_STATUS_BAR]
overwrite_update_statusbar:
                ld      hl, update_statusbar
                call    jump_hub
                ret

SECTION "overwrite_new_button_activity", ROM0[$05df]
overwrite_new_button_activity:
                call    restore_start_button
                nop
                nop

SECTION "overwrite_boss_dead", ROMX[$52cf], BANK[2]
overwrite_boss_dead:
                ld      hl, boss_dead
                call    jump_hub
                ret

SECTION "overwrite_tile_copying", ROM0[$0172]
overwrite_tile_copying:
                call    jump_tile_copying

SECTION "overwrite_unresponsiveness_check", ROM0[$05d5]
overwrite_unresponsiveness_check:
                call    jump_unresponsiveness_check

SECTION "overwrite_cur_fireball", ROM0[$3274]
overwrite_cur_fireball:
                jp      cur_fireball

SECTION "overwrite_found_collision", ROM0[$32b5]
overwrite_found_collision:
                call    found_collision

SECTION "overwrite_jump_deactivate_fireball", ROM0[$32bd]
overwrite_jump_deactivate_fireball:
                jp      jump_deactivate_fireball

SECTION "overwrite_collision_fireball_number", ROM0[$3079]
overwrite_collision_fireball_number:
                jp      collision_fireball_number

SECTION "overwrite_missed_fireball", ROM0[$3435]
overwrite_missed_fireball:
                jp      jump_missed_fireball

SECTION "overwrite_mario_death", ROM0[$3188]
overwrite_mario_death:
                call    mario_death
                ret
                

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF ISCONST(DEBUG)
SECTION "overwrite_music", ROMX[$5638], BANK[4]
overwrite_music:
                ret

SECTION "overwrite_unresponsiveness_setting", ROM0[$20f6]
overwrite_unresponsiveness_setting:
                ld      a, HIGH(UNRESPONSIVE_FRAMES)
                ld      [UNRESPONSIVENESS_COUNTDOWN_MSB], a
                ld      a, LOW(UNRESPONSIVE_FRAMES)
                ld      [UNRESPONSIVENESS_COUNTDOWN_LSB], a
ENDC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



SECTION "main", ROMX[MAIN_ADDR], BANK[MAIN_BANK]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main:
                ld      a, STATE_ENTER_LEVEL
                ld      [CUR_GAME_STATE], a

                ld      a, LEVEL_SPACE
                ld      [CUR_LEVEL], a

                ld      a, POWERUP_FIRE
                ld      [CUR_POWERUP], a

                xor     a
                ld      [NUM_LIVES], a
                ld      [CUR_INDEX], a
                ld      [HAS_ENTERED_ROOM], a
                ld      [HAS_CONTROL], a
                ld      [HAS_PRESSED_RIGHT], a
                ld      [HAS_PRESSED_B], a
                ld      [FRAMES_SINCE_FIRST_B_LSB], a
                ld      [FRAMES_SINCE_FIRST_B_MSB], a
                ld      [FRAMES_SINCE_GAINED_CONTROL_LSB], a
                ld      [FRAMES_SINCE_GAINED_CONTROL_MSB], a
                ld      [FRAMES_SINCE_LAST_LAUNCH_LSB], a
                ld      [FRAMES_SINCE_LAST_LAUNCH_MSB], a
                ld      [LAST_FRAMES_SINCE_GAINED_CONTROL_LSB], a
                ld      [LAST_FRAMES_SINCE_GAINED_CONTROL_MSB], a
                ld      [NUM_FIREBALLS_LAUNCHED], a
                ld      [NUM_B_PRESSES], a
                ld      [CUR_FREQUENCY], a
                ld      [IS_PAUSED], a
                ld      [FIREBALL_1_IS_ACTIVE], a
                ld      [FIREBALL_2_IS_ACTIVE], a
                ld      [BOSS_IS_DEAD], a
                ld      [MARIO_IS_DEAD], a
                ld      [TOOK_DAMAGE], a

                ld      hl, ARRAY
                sthl16  CUR_BG2_POINTER_LSB

                ld      hl, ANALYSIS_SCREEN_BUFFER
                ld      b, 0
                ld      a, EMPTY_TILE
.loop
                ld      [hl+], a
                dec     b
                jr      nz, .loop

                ld      hl, ANALYSIS_SCREEN_BUFFER
                sthl16  CUR_ANALYSIS_SRC_LSB
                ld      hl, BG2_LINE_5
                sthl16  CUR_ANALYSIS_DEST_LSB

                ld      hl, ANALYSIS_SCREEN_BUFFER
                sthl16  NEXT_FREE_LINE_POINTER_LSB

                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
save_countdown:
                ldde16  CUR_BG2_POINTER_LSB
                ld      a, [COUNTDOWN]
                call    print_8bit_number
                inc     de
                inc     de
                stde16  CUR_BG2_POINTER_LSB

                ;ld      a, [CUR_FIREBALL]
                ld      a, [LAST_COLLISION_FIREBALL_NUMBER]
                cp      $85
                jr      nz, .fireball_2
.fireball_1
                ldhl16  CUR_FIREBALL_1_POINTER_LSB
                jr      .cont
.fireball_2
                ldhl16  CUR_FIREBALL_2_POINTER_LSB
.cont
                ld      de, 11
                add     hl, de
                ld      a, TILE_CREDITS_DARK_H
                ld      [hl], a
                ld      de, 6
                add     hl, de
                hl2de
                ld      a, [COUNTDOWN]
                call    print_8bit_number_with_zeroes
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
update_statusbar:
                ld      a, [HAS_ENTERED_ROOM]
                and     a
                ret     z
.update_first_line
                ld      a, [NUM_FIREBALLS_LAUNCHED]
                and     a
                jr      z, .check_pressed_right
.print_num_launched_fireballs
                ld      a, TILE_FIREBALL
                ld      de, BG2_LINE_1+8
                ld      [de], a
                inc     de
                ld      a, TILE_X
                ld      [de], a
                inc     de
                ld      a, [NUM_FIREBALLS_LAUNCHED]
                call    print_8bit_number
.check_pressed_right
                ld      a, [HAS_PRESSED_RIGHT]
                and     a
                jr      z, .check_pressed_b
.has_pressed_right
                ld      a, TILE_RIGHT_ARROW
                ld      [BG2_LINE_1], a
                ld      a, [COUNTDOWN_VAL_AT_RIGHT_PRESS]
                ld      de, BG2_LINE_1+1
                call    print_8bit_number
.check_pressed_b
                ld      a, [HAS_PRESSED_B]
                and     a
                jr      z, .check_cur_frequency
.has_pressed_b
                ld      a, TILE_B
                ld      [BG2_LINE_1+4], a
                ld      a, [COUNTDOWN_VAL_AT_B_PRESS]
                ld      de, BG2_LINE_1+5
                call    print_8bit_number
.check_cur_frequency
                ld      a, [CUR_FREQUENCY]
                and     a
                jr      z, .update_second_line
.print_cur_frequency
                ld      de, BG2_LINE_1+14
                call    print_8bit_number
                inc     de
                ld      a, TILE_PERIOD
                ld      [de], a
                inc     de
                ld      a, [CUR_FREQUENCY_DECIMAL]
                call    print_8bit_number
                inc     de
                ld      a, TILE_CAPITAL_H
                ld      [de], a
                inc     de
                ld      a, TILE_LOWER_Z
                ld      [de], a
                ld      a, EMPTY_TILE
                inc     de
                ld      [de], a
                inc     de
                ld      [de], a
                inc     de
                ld      [de], a
.update_second_line
                ld      b, $20
                ld      hl, ARRAY
                ld      de, BG2_LINE_2+1
.second_line_copy_loop
                ld      a, [hl+]
                ld      [de], a
                inc     de
                dec     b
                jr      nz, .second_line_copy_loop
.check_if_boss_or_mario_dead
                ld      a, [BOSS_IS_DEAD]
                ld      b, a
                ld      a, [MARIO_IS_DEAD]
                or      b
                ret     z
.boss_or_mario_is_dead
                ld      a, GAME_STATE_PAUSED
                ld      [CUR_GAME_STATE], a
                ld      a, 1
                ld      [$a45e], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
after_button_input:
.check_reset
                ld      a, [BUTTONS_PRESSED]
                and     MASK_NON_DIRECTIONAL_BUTTONS
                cp      BUTTONS_A_B_START_SELECT
                jp      z, RESET_GAME_NEXT
.save_button_presses
                ld      a, [BUTTONS_PRESSED]
                ld      [MY_BUTTONS_PRESSED], a
                ld      a, [NEW_BUTTON_ACTIVITY]
                ld      [MY_NEW_BUTTON_ACTIVITY], a
.check_boss_room
                ld      a, [HAS_ENTERED_ROOM]
                and     a
                ret     z
.check_control
                ld      a, [HAS_CONTROL]
                and     a
                ret     z
.check_paused
                ld      a, [IS_PAUSED]
                and     a
                ret     nz
.increase_control_counter
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                inc     hl
                sthl16  FRAMES_SINCE_GAINED_CONTROL_LSB
.check_new_right_press
                ld      a, [BUTTONS_PRESSED]
                and     BUTTON_RIGHT
                jr      z, .check_new_b_press
.check_prev_right_press
                ld      a, [HAS_PRESSED_RIGHT]
                and     a
                jr      nz, .check_new_b_press
.first_right_press
                ld      a, 1
                ld      [HAS_PRESSED_RIGHT], a
                ld      a, [COUNTDOWN]
                ld      [COUNTDOWN_VAL_AT_RIGHT_PRESS], a
                
.check_new_b_press
                ld      a, [BUTTONS_PRESSED]
                and     BUTTON_B
                ret     z
                ld      a, [NEW_BUTTON_ACTIVITY]
                and     BUTTON_B
                ret     z
.check_prev_b_press
                ld      a, [HAS_PRESSED_B]
                and     a
                jr      nz, .not_first_b_press
.first_b_press
                xor     a
                ld      [FRAMES_SINCE_FIRST_B_LSB], a
                ld      [FRAMES_SINCE_FIRST_B_MSB], a
                inc     a
                ld      [NUM_B_PRESSES], a
                ld      [HAS_PRESSED_B], a
                ld      a, [COUNTDOWN]
                ld      [COUNTDOWN_VAL_AT_B_PRESS], a
                ret
.not_first_b_press
.increase_num_b_presses
                ld      a, [NUM_B_PRESSES]
                inc     a
                ld      [NUM_B_PRESSES], a
                call    calculate_cur_frequency
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
toward_end_of_game_loop:
                ld      a, [HAS_PRESSED_B]
                and     a
                ret     z
                ld      a, [IS_PAUSED]
                and     a
                ret     nz
.increase_16bit_frame_counter
                ldhl16  FRAMES_SINCE_FIRST_B_LSB
                inc     hl
                sthl16  FRAMES_SINCE_FIRST_B_LSB
.increase_frames_since_last_b_press
                ldhl16  FRAMES_SINCE_LAST_LAUNCH_LSB
                inc     hl
                sthl16  FRAMES_SINCE_LAST_LAUNCH_LSB
.check_new_b_press
                ld      a, [MY_BUTTONS_PRESSED]
                and     BUTTON_B
                ret     z
                ld      a, [MY_NEW_BUTTON_ACTIVITY]
                and     BUTTON_B
                ret     z
.check_damage
                ld      a, [TOOK_DAMAGE]
                and     a
                ret     z
.took_damage
.register_b_press_in_analysis_table
                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 11
                add     hl, de
                ld      a, TILE_CREDITS_DARK_B
                ld      [hl+], a
                inc     hl
                hl2de
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 20
                add     hl, de
                sthl16  NEXT_FREE_LINE_POINTER_LSB
                ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; a = value
; de = position in vram
print_8bit_number:
                ld      [REST8], a
                cp      10
                jr      c, .check_ones
                cp      100
                jr      c, .check_tens
.have_hundreds
                xor     a
                ld      c, a                            ; c = decimal counter
                ld      a, [REST8]
.hundreds_loop
                sub     100
                jr      c, .hundreds_done
                inc     c
                jr      .hundreds_loop
.hundreds_done
                add     100
                ld      [REST8], a
                ld      a, c
                add     $80
                ld      [de], a
                inc     de
.check_tens
                xor     a
                ld      c, a                            ; reset counter
                ld      a, [REST8]
.tens_loop
                sub     10
                jr      c, .tens_done
                inc     c
                jr      .tens_loop
.tens_done
                add     10
                ld      [REST8], a
                ld      a, c
                add     $80
                ld      [de], a
                inc     de
.check_ones
                ld      a, [REST8]
                add     $80
                ld      [de], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; a = value
; de = position in vram
print_8bit_number_with_zeroes:
                ld      [REST8], a
.check_hundreds
                xor     a
                ld      c, a                            ; c = decimal counter
                ld      a, [REST8]
.hundreds_loop
                sub     100
                jr      c, .hundreds_done
                inc     c
                jr      .hundreds_loop
.hundreds_done
                add     100
                ld      [REST8], a
                ld      a, c
                add     $80
                ld      [de], a
                inc     de
.check_tens
                xor     a
                ld      c, a                            ; reset counter
                ld      a, [REST8]
.tens_loop
                sub     10
                jr      c, .tens_done
                inc     c
                jr      .tens_loop
.tens_done
                add     10
                ld      [REST8], a
                ld      a, c
                add     $80
                ld      [de], a
                inc     de
.check_ones
                ld      a, [REST8]
                add     $80
                ld      [de], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; hl = 16-bit number
; de = pointer in VRAM
; prints the 3 least significant digits
print_16bit_number:
.check_ten_thousands
                xor     a
                ld      bc, -10000
.ten_thousands_loop
                add     hl, bc
                jr      nc, .ten_thousands_done
                inc     a
                jr      .ten_thousands_loop
.ten_thousands_done
                ld      bc, 10000
                add     hl, bc
.check_one_thousands
                xor     a
                ld      bc, -1000
.one_thousands_loop
                add     hl, bc
                jr      nc, .one_thousands_done
                inc     a
                jr      .one_thousands_loop
.one_thousands_done
                ld      bc, 1000
                add     hl, bc
.check_one_hundreds
                xor     a
                ld      bc, -100
.one_hundreds_loop
                add     hl, bc
                jr      nc, .one_hundreds_done
                inc     a
                jr      .one_hundreds_loop
.one_hundreds_done
                add     $80
                ld      [de], a
                inc     de
                ld      bc, 100
                add     hl, bc
.check_tens
                xor     a
                ld      bc, -10
.tens_loop
                add     hl, bc
                jr      nc, .tens_done
                inc     a
                jr      .tens_loop
.tens_done
                add     $80
                ld      [de], a
                inc     de
                ld      bc, 10
                add     hl, bc
.check_ones
                ld      a, l
                add     $80
                ld      [de], a
                ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_fireball_launch:
                ld      a, [HAS_CONTROL]
                and     a
                ret     z
.has_pressed_b
                ld      a, c
                ld      l, a
                call    register_fireball_launch
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
register_fireball_launch:
.increase_num_fireballs_launched
                ld      a, [NUM_FIREBALLS_LAUNCHED]
                inc     a
                ld      [NUM_FIREBALLS_LAUNCHED], a
                cp      MAX_ANALYSIS_LINES+1
                ret     nc
.update_analysis_screen
                ldde16  NEXT_FREE_LINE_POINTER_LSB
                ld      a, l
                cp      $80
                jr      nz, .have_fireball_2
.have_fireball_1
                stde16  CUR_FIREBALL_1_POINTER_LSB
                jr      .cont
.have_fireball_2
                stde16  CUR_FIREBALL_2_POINTER_LSB
.cont
                ld      a, [NUM_FIREBALLS_LAUNCHED]
                push    de
                call    print_8bit_number
                pop     de
.check_delta
                ld      a, [NUM_FIREBALLS_LAUNCHED]
                cp      2
                jr      c, .no_delta
.print_delta
                inc     de
                inc     de
                inc     de
                ldhl16  FRAMES_SINCE_LAST_LAUNCH_LSB
                call    print_16bit_number
                inc     de
                inc     de
                jr      .print_end
.no_delta:
                ld      hl, 7
                add     hl, de
                hl2de
.print_end
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number

                xor     a
                ld      [FRAMES_SINCE_LAST_LAUNCH_LSB], a
                ld      [FRAMES_SINCE_LAST_LAUNCH_MSB], a

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 20
                add     hl, de
                sthl16  NEXT_FREE_LINE_POINTER_LSB

                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
calculate_cur_frequency:
.check_for_division_by_zero
                ld      a, [FRAMES_SINCE_FIRST_B_LSB]
                ld      b, a
                ld      a, [FRAMES_SINCE_FIRST_B_MSB]
                or      b
                ret     z
.no_division_by_zero
                ld      a, [NUM_B_PRESSES]
                cp      2
                ret     c
.pressed_b_enough_times
                dec     a               ; important! else off-by-one error
.calculate_60_times_num_fireballs
                ; 60a = (16a-a)*4
                ld      b, a            ; b = a
                ld      l, a
                xor     a
                ld      h, a            ; hl = a

                add     hl, hl
                add     hl, hl
                add     hl, hl
                add     hl, hl          ; hl = 16a

                ld      a, l
                sub     b
                ld      l, a
                jr      nc, .mul_no_carry
.mul_have_carry
                dec     h               ; hl = 15a
.mul_no_carry
                add     hl, hl
                add     hl, hl          ; hl = 60a
.invert_num_frames
                xor     a
                ld      e, a            ; e = 0
                ld      a, [FRAMES_SINCE_FIRST_B_MSB]
                ld      d, a            ; d = FRAMES_SINCE_FIRST_B_MSB
                ld      a, [FRAMES_SINCE_FIRST_B_LSB]
                ld      b, a            ; b = FRAMES_SINCE_FIRST_B_LSB
                xor     a
                sub     b
                ld      c, a            ; c = -FRAMES_SINCE_FIRST_B_LSB

                ld      a, e            ; a = 0
                sbc     d
                ld      b, a            ; b = -FRAMES_SINCE_FIRST_B_MSB
                push    bc
.divide
                xor     a               ; a = quotient
.divide_loop
                add     hl, bc
                jr      nc, .division_finished
                inc     a
                jr      .divide_loop
.division_finished
                ld      [CUR_FREQUENCY], a
.calculate_first_decimal
                ldbc16  FRAMES_SINCE_FIRST_B_LSB
                add     hl, bc          ; hl = rest

                ld      a, h
                ld      d, a
                ld      a, l
                ld      e, a            ; de = rest

                add     hl, hl
                add     hl, hl
                add     hl, hl          ; hl = 8*rest
                add     hl, de
                add     hl, de          ; hl = 8*rest + 2*rest = 10*rest

                xor     a               ; a = counter
.divide_decimal
                pop     bc              ; bc = inverted frame counter
.divide_decimal_loop
                add     hl, bc
                jr      nc, .decimal_division_finished
                inc     a
                jr      .divide_decimal_loop
                ret
.decimal_division_finished
                ld      [CUR_FREQUENCY_DECIMAL], a

                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
taking_damage:
                ldde16  CUR_BG2_POINTER_LSB
                ld      a, TILE_SKULL
                ld      [de], a
                inc     de
                inc     de
                stde16  CUR_BG2_POINTER_LSB

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 11
                add     hl, de
                ld      a, TILE_SKULL
                ld      [hl], a

                inc     hl
                inc     hl
                hl2de
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 20
                add     hl, de
                sthl16  NEXT_FREE_LINE_POINTER_LSB

                ld      a, $1
                ld      [TOOK_DAMAGE], a

                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
paused:
                ld      a, OBJ_ON_FLAG
                xor     $ff
                ld      b, a
                ld      a, [LCDC]
                and     b
                ld      [LCDC], a
                
                ld      a, [BOSS_IS_DEAD]
                and     a
                jr      nz, .cont
                ld      a, [MARIO_IS_DEAD]
                and     a
                jr      nz, .cont
                ld      a, [NEW_BUTTON_ACTIVITY]
                bit     BIT_BUTTON_START, a
                jr      nz, .unpause
.cont
                ld      a, 1
                ld      [IS_PAUSED], a
                ld      b, $93
                ret
.unpause
                xor     a
                ld      [IS_PAUSED], a
                ld      a, STATUS_BAR_Y
                ld      [WY], a
                ld      a, OBJ_ON_FLAG
                ld      b, a
                ld      a, [LCDC]
                or      b
                ld      [LCDC], a
                jp      $2793


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init_statusbar:
                ld      bc, $400
                ld      hl, BG2_LINE_1
.tile_loop
                ld      a, EMPTY_TILE
                ld      [hl+], a
                dec     bc
                ld      a, b
                or      c
                jr      nz, .tile_loop
.array
                ld      hl, ARRAY
                ld      b, $40
                ld      a, EMPTY_TILE
.array_loop
                ld      [hl+], a
                dec     b
                jr      nz, .array_loop
.setup_table
                ld      a, TILE_CREDITS_N
                ld      [BG2_LINE_4+0], a

                ld      a, TILE_CREDITS_D
                ld      [BG2_LINE_4+3], a
                ld      a, TILE_CREDITS_E
                ld      [BG2_LINE_4+4], a
                ld      a, TILE_CREDITS_L
                ld      [BG2_LINE_4+5], a

                ld      a, TILE_CREDITS_B
                ld      [BG2_LINE_4+7], a
                ld      a, TILE_CREDITS_E
                ld      [BG2_LINE_4+8], a
                ld      a, TILE_CREDITS_G
                ld      [BG2_LINE_4+9], a

                ld      a, TILE_CREDITS_E
                ld      [BG2_LINE_4+13], a
                ld      a, TILE_CREDITS_N
                ld      [BG2_LINE_4+14], a
                ld      a, TILE_CREDITS_D
                ld      [BG2_LINE_4+15], a

                ld      a, TILE_CREDITS_C
                ld      [BG2_LINE_4+17], a
                ld      a, TILE_SLASH
                ld      [BG2_LINE_4+18], a
                ld      a, TILE_CREDITS_D
                ld      [BG2_LINE_4+19], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
boss_dead:
                ld      a, 1
                ld      [BOSS_IS_DEAD], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
tile_copying:
.check_analysis_screen
                ld      a, [IS_PAUSED]
                and     a
                jr      nz, .scroll_window_up
.window_already_up
                ld      hl, ANALYSIS_SCREEN_BUFFER
                sthl16  CUR_ANALYSIS_SRC_LSB
                ld      hl, BG2_LINE_5
                sthl16  CUR_ANALYSIS_DEST_LSB
                ret
.scroll_window_up
                ld      a, [WY]
                and     a
                ret     z
                ld      b, 4
                sub     b
                ld      [WY], a

.update_analysis_screen
                ldde16  CUR_ANALYSIS_SRC_LSB
                ldhl16  CUR_ANALYSIS_DEST_LSB
                ld      a, h
                cp      $9e
                ret     z
                ld      b, 20
.col_loop
                ld      a, [de]
                ld      [hl+], a
                inc     de
                dec     b
                jr      nz, .col_loop
.update_pointers
                ld      bc, 12
                add     hl, bc
                stde16  CUR_ANALYSIS_SRC_LSB
                sthl16  CUR_ANALYSIS_DEST_LSB
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
unresponsiveness_check:
                ld      a, [HAS_ENTERED_ROOM]
                and     a
                ret     z
                ld      a, [HAS_CONTROL]
                and     a
                ret     nz
                ld      a, [UNRESPONSIVENESS_COUNTDOWN_LSB]
                ld      b, a
                ld      a, [UNRESPONSIVENESS_COUNTDOWN_MSB]
                or      b
                ret     nz
                ld      a, 1
                ld      [HAS_CONTROL], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
missed_fireball:
                ld      a, [HAS_CONTROL]
                and     a
                ret     z
                ld      a, b
                cp      $80
                jr      nz, .fireball_2
.fireball_1
                ldhl16  CUR_FIREBALL_1_POINTER_LSB
                jr      .cont
.fireball_2
                ldhl16  CUR_FIREBALL_2_POINTER_LSB
.cont
                ld      de, 11
                add     hl, de
                ld      a, TILE_X
                ld      [hl+], a
                inc     hl
                hl2de
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number

                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
third_fireball:
                ld      a, [HAS_CONTROL]
                and     a
                ret     z

                ldhl16  CUR_BG2_POINTER_LSB
                ld      a, TILE_INACTIVE_FIREBALL
                ld      [hl+], a
                inc     hl
                sthl16  CUR_BG2_POINTER_LSB

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                inc     hl
                inc     hl
                inc     hl
                hl2de
                ldhl16  FRAMES_SINCE_LAST_LAUNCH_LSB
                call    print_16bit_number

                inc     de
                inc     de
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number

                inc     de
                inc     de
                ld      a, TILE_INACTIVE_FIREBALL
                ld      [de], a

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 20
                add     hl, de
                sthl16  NEXT_FREE_LINE_POINTER_LSB

                xor     a
                ld      [FRAMES_SINCE_LAST_LAUNCH_LSB], a
                ld      [FRAMES_SINCE_LAST_LAUNCH_MSB], a
                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
save_stomp:
                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 11
                add     hl, de
                ld      a, TILE_CREDITS_DARK_S
                ld      [hl+], a
                hl2de
                inc     de
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number

                ldhl16  NEXT_FREE_LINE_POINTER_LSB
                ld      de, 20
                add     hl, de
                sthl16  NEXT_FREE_LINE_POINTER_LSB
                ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
deactivate_fireball:
                ld      a, [CUR_FIREBALL]
                cp      $85
                jr      nz, .fireball_2
.fireball_1
                ldhl16  CUR_FIREBALL_1_POINTER_LSB
                jr      .cont
.fireball_2
                ldhl16  CUR_FIREBALL_2_POINTER_LSB
.cont
                ld      de, 13
                add     hl, de
                hl2de
                ldhl16  FRAMES_SINCE_GAINED_CONTROL_LSB
                call    print_16bit_number
                ret


debug4:

SECTION "startingpos", ROMX[SPACE_STARTING_POS_ADDR], BANK[SPACE_STARTING_POS_BANK]
                db      $d4, $00, $d0, $0f, $c0, $00, $b0, $0f

SECTION "tile_right_arrow", ROMX[$79e0], BANK[$1b]
                db      $f7, $00, $f3, $00, $f1, $00, $00, $00
                db      $00, $00, $00, $f1, $f1, $02, $f3, $04

SECTION "tile_fireball", ROMX[$79f0], BANK[$1b]
                db      $a7, $00, $d1, $00, $70, $04, $c0, $06
                db      $84, $1a, $88, $34, $81, $18, $c3, $00

SECTION "tile_capital_h", ROMX[$7a00], BANK[$1b]
                db      $ff, $00, $39, $00, $39, $00, $01, $00
                db      $01, $38, $39, $00, $39, $00, $39, $c6

SECTION "tile_lower_z", ROMX[$7a10], BANK[$1b]
                db      $ff, $00, $ff, $00, $81, $00, $81, $32
                db      $a3, $44, $c5, $08, $81, $00, $81, $7e

SECTION "tile_period", ROMX[$7a20], BANK[$1b]
                db      $ff, $00, $ff, $00, $ff, $00, $ff, $00
                db      $ff, $00, $e7, $00, $e7, $00, $e7, $18

SECTION "tile_skull", ROMX[$7a30], BANK[$1b]
                db      $ff, $00, $83, $00, $01, $00, $6d, $00
                db      $01, $00, $11, $00, $83, $00, $ab, $00

SECTION "tile_inactive_fireball", ROMX[$7a40], BANK[$1b]
                db      $a7, $58, $d1, $2e, $74, $8b, $c6, $39
                db      $9e, $61, $bc, $43, $99, $66, $c3, $3c

SECTION "tile_credits_b", ROMX[$7a50], BANK[$1b]
                db      $ff, $00, $ff, $fc, $ff, $c6, $ff, $c6
                db      $ff, $fc, $ff, $c6, $ff, $c6, $ff, $fc

SECTION "tile_credits_c", ROMX[$7a60], BANK[$1b]
                db      $ff, $00, $ff, $7c, $ff, $c6, $ff, $c6
                db      $ff, $c0, $ff, $c6, $ff, $c6, $ff, $7c

SECTION "tile_credits_d", ROMX[$7a70], BANK[$1b]
                db      $ff, $00, $ff, $fc, $ff, $66, $ff, $66
                db      $ff, $66, $ff, $66, $ff, $66, $ff, $fc

SECTION "tile_credits_e", ROMX[$7a80], BANK[$1b]
                db      $ff, $00, $ff, $fe, $ff, $c0, $ff, $c0
                db      $ff, $fc, $ff, $c0, $ff, $c0, $ff, $fe

SECTION "tile_credits_g", ROMX[$7a90], BANK[$1b]
                db      $ff, $00, $ff, $7c, $ff, $c6, $ff, $c0
                db      $ff, $de, $ff, $c6, $ff, $c6, $ff, $7e

SECTION "tile_credits_l", ROMX[$7aa0], BANK[$1b]
                db      $ff, $00, $ff, $c0, $ff, $c0, $ff, $c0
                db      $ff, $c0, $ff, $c0, $ff, $c0, $ff, $fe

SECTION "tile_credits_n", ROMX[$7ab0], BANK[$1b]
                db      $ff, $00, $ff, $c6, $ff, $e6, $ff, $f6
                db      $ff, $de, $ff, $ce, $ff, $c6, $ff, $c6

SECTION "tile_slash", ROMX[$7ac0], BANK[$1b]
                db      $ff, $00, $ff, $0c, $ff, $0c, $ff, $18
                db      $ff, $18, $ff, $18, $ff, $30, $ff, $30

SECTION "tile_credits_dark_s", ROMX[$7ad0], BANK[$1b]
                db      $ff, $00, $83, $00, $39, $00, $3f, $00
                db      $83, $00, $f9, $00, $39, $00, $83, $00

SECTION "tile_credits_dark_h", ROMX[$7ae0], BANK[$1b]
                db      $ff, $00, $39, $00, $39, $00, $39, $00
                db      $01, $00, $39, $00, $39, $00, $39, $00

SECTION "tile_credits_dark_b", ROMX[$7af0], BANK[$1b]
                db      $ff, $00, $03, $00, $39, $00, $39, $00
                db      $03, $00, $39, $00, $39, $00, $03, $00
