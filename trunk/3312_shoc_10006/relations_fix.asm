alife__release_callback proc
	mov		edx, [ebp+8h]
	mov		eax, [edx]
	mov		edx, [eax+7Ch]
	call	edx
	test	eax, eax
	jz		no_monster_or_stalker

	pusha
	mov		edx, [ebp+8h]
	add		edx, 36h
	movzx	edx, word ptr [edx]
	push	edx
	; вызываем очистку записи удаляемого непися
	push	edx
	call	RELATION_REGISTRY__ClearRelations
	pop		edx
	
	; вызываем колбек, чтобы почистить из скриптов зависимые записи
	xor		eax, eax
	push	eax
	push    edx 	; id
	push    146
	mov     ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int
	popa
	
no_monster_or_stalker:
	; делаем вырезанное
	test	bl, bl
	mov		byte ptr [esi+84h], 0
	jmp	back_from_alife__release_callback
alife__release_callback endp

; колбек на изменение репутации
RELATION_REGISTRY__SetGoodwill_callback proc
	; делаем вырезанное
	mov     [eax], esi

	; делаем свое
	pusha
	mov		eax, [ebp+0Ch]
	push	eax		; to
	mov		eax, [ebp+8h]
	push    eax 	; from
	push    145
	mov     ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int
	popa
	
	; возвращаемся
	pop     esi
	mov     esp, ebp
	jmp     back_from_RELATION_REGISTRY__SetGoodwill_callback
RELATION_REGISTRY__SetGoodwill_callback endp

; функция для удаления реестра отношений для объекта
RELATION_REGISTRY__ClearRelations proc
person_id       = word ptr  4

	call    RELATION_REGISTRY__relation_registry ; CRelationRegistryWrapper * RELATION_REGISTRY::relation_registry()
	movzx   ecx, word ptr [esp+person_id]
	mov     eax, [eax+4]
	push    ecx             ; id
	call    CALifeRegistryWrapper__objects_ptr ; CALifeRegistryWrapper<CALifeAbstractRegistry<ushort,RELATION_DATA>>::objects_ptr_no_insert(ushort)
	test    eax, eax
	jz      no_object
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+4]
	call    eax
	; отладка
;	movzx	eax, [esp+person_id]
;	PRINT_UINT "RELATIONS CLEARED FOR OBJECT %d", eax

no_object:
	retn    4
RELATION_REGISTRY__ClearRelations endp

; функция для удаления записи отношений одного объекта к другому
RELATION_REGISTRY__ClearPersonalRecord proc
	rel_it			=	dword ptr -8
	_Where			=	dword ptr -4
	from	        =	word ptr  4
	to              =	word ptr  8

	sub		esp, 8
	push    esi
	call    RELATION_REGISTRY__relation_registry ; CRelationRegistryWrapper * RELATION_REGISTRY::relation_registry()
	mov     ecx, dword ptr [esp+0Ch+from] ; this
	mov     eax, [eax+4]
	push    ecx             ; id
	call    CALifeRegistryWrapper__objects_ptr ; CALifeRegistryWrapper<CALifeAbstractRegistry<ushort,RELATION_DATA>>::objects_ptr(ushort)
	test    eax, eax
	jz      short no_object_exit

	lea     esi, [eax+8]
	lea     ebx, [esp+0Ch+to] ; _Keyval
	lea     eax, [esp+0Ch+rel_it]
	mov     ecx, esi
	call    SRelation_map__find ; std::_Tree<std::_Tmap_traits<ushort,SRelation,std::less<ushort>,xalloc<std::pair<ushort,SRelation>>,0>>::find(ushort const &)
	mov     eax, dword ptr [esp+0Ch+rel_it]
	cmp     eax, [esi+4]
	jz      short no_object_exit
	
	push    eax
	lea     edx, [esp+10h+_Where]
	push    edx             ; _Where
	push    esi             ; result
	call    SRelation_map__erase ; std::_Tree<std::_Tmap_traits<uint,CState<CAI_Boar> *,std::less<uint>,xalloc<std::pair<uint,CState<CAI_Boar> *>>,0>>::erase(std::_Tree_const_iterator<std::_Tree_val<std::_Tmap_traits<uint,CState<CAI_Boar> *,std::less<uint>,xalloc<std::pair<uint,CState<CAI_Boar> *>>,0>>>)
	; отладка
;	movzx	eax, [esp+0Ch+to]
;	PRINT_UINT "RELATION RECORD DELETED FOR OBJECT %d", eax

no_object_exit:
	pop     esi
	add		esp, 8
	retn    8
RELATION_REGISTRY__ClearPersonalRecord endp