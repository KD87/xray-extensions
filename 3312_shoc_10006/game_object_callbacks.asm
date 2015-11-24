CCustomZone__hit_callback:
	push	eax
	push	edi
	call 	CCustomZone__set_callback

	; Вырезанное
	mov		ebp, esp
	and		esp, 0FFFFFFF8h
	
	; Возврат
	jmp 	CCustomZone__hit_callback_back

CCustomZone__PlayHitParticles: ; CCustomZone *this<ebx>, CGameObject *pObject<eax>
	push	eax
	push	ebx

	call	CCustomZone__set_callback

	; Вырезанное.
	fldz
	sub esp, 10h
	
	; Возврат.
	jmp CCustomZone__PlayHitParticles_Back

CCustomZone__set_callback proc
anom = dword ptr 8
obj = dword ptr 0Ch
	push	ebp
	mov		ebp, esp

	push	eax
	push	ecx
	push	edi
	
	mov 	edi, [ebp+obj]
	call 	CGameObject__lua_game_object
	
	push 	eax
	push 	128

	mov 	ecx, [ebp+anom]
	call    CGameObject__callback
	push    eax
	call    script_use_callback

	pop		edi
	pop		ecx
	pop		eax
	pop		ebp
	
	retn	8
CCustomZone__set_callback endp

CTorch__Switch_Callback:      ; CTorch* <esi>, light_on <al>
	push	edi
	
	xor		ebx, ebx
	mov		bl, al
	
	push    0               
	push    offset ??_R0?AVCGameObject@@@8
	push    offset off_10538CFC ; AVCTorch
	push    0
	push    esi             
	call    __RTDynamicCast
	add     esp, 14h	

	push    0
	push    ebx

	push    134 
	mov     ecx, eax
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int	

	pop		edi
	mov		eax, ebx

	mov 	ecx, [esi+18Ch]

	jmp 	CTorch__Switch_Callback_Back
CMovementManager__set_level_dest_vertex_callback:
	;PRINT 	"be"
	call	CMovementManager__set_level_dest_vertex

	push	eax
	push	ecx
	
	push    0
	push    esi ;level_vertex_id	
	
	;PRINT_UINT "lvid: %d", esi

	push    135 
	mov     ecx, edi 
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int	

	pop		ecx
	pop		eax
	
	jmp		CMovementManager__set_level_dest_vertex_callback_back
	
CActor__attach_Vehicle_callback proc
	; Вырезанное в начале.
	add     esp, 14h
	mov     ebp, eax
	
	; eax = ebp = CCar*
	pusha
	test	eax, eax
	jz		short exit

	mov 	edi, eax
	call 	CGameObject__lua_game_object	
	
	test	eax, eax
	jz		short exit
	
	push 	eax
	push 	137

	mov 	ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_use_callback
exit:	
	popa
	jmp		CActor__attach_Vehicle_callback_back
CActor__attach_Vehicle_callback endp

CActor__detach_Vehicle_callback proc
	; Вырезанное
	add     esp, 14h
	test	eax, eax
	
	; eax = CCar*
	pusha
	jz		short exit

	mov 	edi, eax
	call 	CGameObject__lua_game_object
	
	test	eax, eax
	jz		short exit
	
	push 	eax
	push 	139

	mov 	ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_use_callback
exit:	
	popa
	test	eax, eax
	jmp		CActor__detach_Vehicle_callback_back
CActor__detach_Vehicle_callback endp

CActor__use_Vehicle_callback proc
	; Вырезанное
	call    edx
	test    al, al
	jnz		CActor__use_Vehicle_callback_skip
	
	; esi = CHolderCustom*
	pusha

	RT_DYNAMIC_CAST ??_R0?AVCHolderCustom@@@8, ??_R0?AVCCar@@@8, esi
	
	test	eax, eax
	jz		short exit
	
	mov 	edi, eax
	call 	CGameObject__lua_game_object
	
	test	eax, eax
	jz		short exit
	
	push 	eax
	push 	138

	mov 	ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_use_callback	
exit:
	popa
	jmp		CActor__use_Vehicle_callback_exit
CActor__use_Vehicle_callback endp

after_save_callback proc
	mov		ecx, g_Actor
	test	ecx, ecx
	jz		short exit

	push 	0
	push 	140
	call    CGameObject__callback
	push    eax
	call    script_use_callback		
exit:
	pop     edi
	pop     esi
	pop     ebp
	pop     ebx
	pop     ecx
	retn    4
after_save_callback endp

; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
; хит от неписей
CActor__HitMark_callback proc
	; делаем вырезанное
	call    sprintf_s64
	add     esp, 8
	; делаем свое
	pusha
	push    edi ; side
	push    0 ; mob type: 0 - stalker, 1 - monster
	push    144
	mov     ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int
	popa
	; возвращаемся
	jmp     back_from_CActor__HitMark_callback
CActor__HitMark_callback endp

; хит от монстров
CBaseMonster__HitEntity_callback proc
	; делаем вырезанное
	call    sprintf_s64
	add     esp, 0Ch
	; делаем свое
	pusha
	push    edi ; side
	push    1 ; mob type: 0 - stalker, 1 - monster
	push    144
	mov     ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int
	popa
	; возвращаемся
	jmp     back_from_CBaseMonster__HitEntity_callback
CBaseMonster__HitEntity_callback endp

; колбек вызывается перед первым апдейтом актора
g_actor_first_update dd 1
CActor__shedule_Update_fix proc
	; делаем свое
	cmp     [g_actor_first_update], 1
	jnz     short exit
	pusha
	; вызываем колбек
	mov     ecx, g_Actor
	test    ecx, ecx
	jz      short skip_callback
	push    0 ; nil
	push    150
	call    CGameObject__callback
	push    eax
	call    script_use_callback
skip_callback:
	; сбрасываем флажок
	popa
	mov     [g_actor_first_update], 0
exit:
	; делаем вырезанное
	mov     edx, [ebx+230h]
	mov     esi, [ebp+8]
	mov     eax, [edx+48h]
	lea     ecx, [ebx+230h]
	push    esi
	call    eax
	; возвращаемся
	jmp     back_from_CActor__shedule_Update_fix
CActor__shedule_Update_fix endp

CActor__net_Destroy_fix:
	; делаем свое
	; восстанавливаем флаг
	mov     [g_actor_first_update], 1
	; делаем вырезанное
	mov     edx, [eax+28Ch]
	mov     ecx, esi
	call    edx
	; возвращаемся
	jmp     back_from_CActor__net_Destroy_fix
; =========================================================================================
; ======================================= END =============================================
; =========================================================================================
