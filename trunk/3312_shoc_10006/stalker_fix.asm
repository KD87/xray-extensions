CAI_Stalker__IsVisibleForZones proc
	mov eax, [ecx+638h]
	;PRINT_UINT "CAI_Stalker__IsVisibleForZones: flags=%x", eax
	and     eax, 80000000h
	jz      visible_
	mov     al, 0
	jmp     invisible_
visible_:
	mov     al, 1
invisible_:
	retn
CAI_Stalker__IsVisibleForZones endp

CAI_Stalker__feel_touch_new_fix proc
	; проверяем флаг и если выставлен, то не делаем ничего
	mov eax, [ecx+638h - 2f0h]
	;PRINT_UINT "CAI_Stalker__feel_touch_new: flags=%x", eax
	and     eax, 40000000h
	jz      feel_item_touch
	retn    4
feel_item_touch:
	; делаем то, что вырезали
	mov     eax, 2010h
	; идём обратно
	jmp     back_from_CAI_Stalker__feel_touch_new_fix
CAI_Stalker__feel_touch_new_fix endp


float_zero  dd 0.0

CEntityAlive__Hit_fix proc near

var_68          = dword ptr -68h
var_5C          = dword ptr -5Ch
var_4C          = dword ptr -4Ch
HDS             = dword ptr -48h
var_40          = dword ptr -40h
var_3C          = byte ptr -3Ch
var_30          = dword ptr -30h
var_28          = dword ptr -28h
var_14          = dword ptr -14h
pHDS            = dword ptr  8
ignore_flags    = dword ptr 0h

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	mov     edx, [ebp+pHDS]
	sub     esp, 4Ch
	push    ebx
	push    esi
	push    edi
	; 
	;PRINT "CEntityAlive__Hit"
	mov     ebx, ecx ; ebx == entity_alive ; до конца функции!
	; HDS = *pHDS;
	mov     ecx, 12h ; 12h раз по 4 байта
	mov     esi, edx
	lea     edi, [esp+58h+HDS]
	rep movsd
	;
	lea     edi, [esp+58h+HDS] ; в edi будет указатель на локальную копию параметров хита
	lea     esi, [esp+58h+ignore_flags]
	mov     dword ptr [esi], 777
	; вызываем колбек
	;pusha
	push edx
	push ecx
	push eax
	push edi
	
	;jmp end_hit_call
	
	;mov    [ebp+ignore_flags], eax
	;lea     eax, [ebp+ignore_flags]
	xor     eax, eax
	;mov     eax, 777
	push    eax ; флаги игнора
	;
	mov     eax, esp
	push    eax ; адрес флагов игнора в стеке
	push    edi ; параметры хита
	push    152 ; константа - тип колбека
	mov     ecx, ebx ; this
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	; вынимаем флаги игнора из стека и помещаем в esi
	pop     esi
	;PRINT_UINT "ignore_flags: %d", esi
	;
end_hit_call:
	pop edi
	pop eax
	pop ecx
	pop edx
	
	test esi, esi
	jnz ignore_hit
	;popa
	; ----------- end hit collback
	; 
	
	mov     ecx, [esp+58h+var_30]
	pusha
	test    ecx, ecx
	jz      skip_callback
	
	mov     edx, [ecx]
	mov     eax, [edx+7Ch]
	call    eax
	test    eax, eax
	jz      skip_callback 

	mov		edi, eax
	call	CGameObject__lua_game_object
	
	test	eax, eax
	jz		short skip_callback
	
	; В коллбеке надо сделать set_int_arg0(1), чтобы НПС проигнорировал хит.
	mov		g_int_argument_0, 0
	
	push 	eax
	push 	153

	mov 	ecx, ebx
	call    CGameObject__callback
	push    eax
	call    script_use_callback		
	popa
	cmp		g_int_argument_0, 1
	mov		g_int_argument_0, 0
	je		ignore_hit
	jmp		short continue
skip_callback:
	popa
continue:
	cmp     [esp+58h+var_14], 9 ; if (HDS.hit_type == ALife::eHitTypeWound_2)
	jnz     short lab1
	mov     [esp+58h+var_14], 3 ; HDS.hit_type == ALife::eHitTypeWound

lab1:
	movzx   ecx, byte ptr [edx+3Ch]
	mov     eax, [ebx+220h] ; this->m_entity_condition
	push    ecx             ; aim_bullet
	lea     edx, [eax+0E0h]
	push    edx             ; wound_scale
	add     eax, 0DCh
	push    eax             ; hit_scale
	movzx   eax, word ptr [esp+64h+var_28]
	push    eax             ; element
	lea     ecx, [ebx+1A8h] ; this  = 
	call    CDamageManager__HitScale ; CDamageManager::HitScale(HDS.boneID, conditions().hit_bone_scale(), conditions().wound_bone_scale(), pHDS->aim_bullet)
	;
	mov     ecx, [ebx+220h] ; this->m_entity_condition
	mov     edx, [ecx]
	mov     edx, [edx+20h]
	lea     eax, [esp+58h+HDS]
	push    eax
	call    edx ; CWound*wound = conditions().ConditionHit(&HDS);
	;
	test    eax, eax 
	jz      short lab4 ; if (!wound) goto lab4
	mov     ecx, [esp+58h+var_14]
	test    ecx, ecx
	jnz     short lab2 ; if(ALife::eHitTypeBurn != HDS.hit_type) // eHitTypeBurn == 0
	mov     edx, [ebx]
	push    eax
	mov     eax, [edx+20Ch]
	;PRINT "burn!!!!!!!!!!!!!!!!!!"
	jmp     short lab5
; ---------------------------------------------------------------------------

lab2:
	cmp     ecx, 3 ; ALife::eHitTypeWound
	jz      short lab3
	cmp     ecx, 8 ; eHitTypeFireWound
	jnz     short lab4

lab3:
	mov     edx, [ebx]
	push    eax
	mov     eax, [edx+220h] ; this->m_entity_condition

lab5:
	mov     ecx, ebx
	call    eax ; вызов одной из двух функций: StartBloodDrops (eHitTypeWound || eHitTypeFireWound) или StartFireParticles (eHitTypeBurn)

lab4:
	cmp     [esp+58h+var_14], 5
	jz      short lab6 ; if (HDS.hit_type != ALife::eHitTypeTelepatic)
	mov     edx, [ebx]
	mov     eax, [edx+1E8h]
	mov     ecx, ebx
	call    eax
	test    al, al
	jnz     short lab6 ; if (!use_simplified_visual())
	mov     ecx, [esp+58h+var_28]
	fld     [esp+58h+var_40]
	mov     edx, [ebx]
	mov     edx, [edx+218h]
	lea     eax, [esp+58h+var_28+2]
	push    eax
	push    ecx
	lea     eax, [esp+60h+var_3C]
	push    eax
	push    ecx
	mov     ecx, ebx
	fstp    [esp+68h+var_68]
	call    edx
lab6:
;
	mov     eax, [ebx+220h]; this->m_entity_condition
	xorps   xmm0, xmm0
	lea     ecx, [esp+58h+HDS]
	push    ecx
	mov     ecx, ebx
	movss   dword ptr [eax+0D0h], xmm0 ; this_->m_entity_condition->m_fDeltaTime) = 0;
	call    CEntity__Hit
	;
	mov     edx, [ebx+1B8h]
	movss   xmm0, dword ptr [edx+4]
	comiss  xmm0, ds:float_zero
	jbe     exit  ; if (!alive) goto exit;
	;
	mov     eax, ds:g_pGamePersistent
	mov     ecx, [eax]
	mov     eax, [ecx+424h]
	cmp     eax, 1
	jz      short lab7
	test    eax, eax
	jnz     short exit ; if (!single_game) goto exit;
lab7:
	; CEntityAlive* who = cast (HDS.who)
	mov     ecx, [esp+58h+var_30]
	test    ecx, ecx
	jz      short exit
	mov     edx, [ecx]
	mov     eax, [edx+7Ch]
	call    eax
	mov     esi, eax
	test    esi, esi
	jz      short exit ; if ('who' is not CEntoryAlive) goto exit;
	;
	mov     ecx, [esi+1B8h]
	movss   xmm0, dword ptr [ecx+4]
	comiss  xmm0, ds:float_zero
	jbe     short exit ; if (!alive(who)) goto exit;
	movzx   eax, word ptr [esi+0A4h]
	movzx   ecx, word ptr [ebx+0A4h]
	cmp     ax, cx
	jz      short exit ; if (who->id() == this->id()) goto exit;
	;
	fld     [esp+58h+var_40]
	movzx   edx, ax
	mov     eax, [ebx]
	push    ecx
	movzx   edi, cx
	fstp    [esp+5Ch+var_5C]
	mov     [esp+5Ch+var_4C], edx
	mov     edx, [eax+228h]
	push    esi
	mov     ecx, ebx
	call    edx
	push    eax
	mov     eax, [esp+60h+var_4C]
	push    eax
	call    RELATION_REGISTRY__FightRegister
	;
	push    1
	push    ebx
	push    esi
	lea     ecx, [esp+64h+var_4C] ; this = 
	mov     [esp+64h+var_4C], offset off_1048A064
	call    RELATION_REGISTRY__Action

exit:
ignore_hit:
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CEntityAlive__Hit_fix endp



CEntity__Hit_fix proc
	;PRINT "CEntity__Hit_fix"
	;
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	;
	jmp back_from_CEntity__Hit_fix
CEntity__Hit_fix endp
