clear_relations_before_deleting proc
	mov		edx, [ebp+8h]
	mov		eax, [edx]
	mov		edx, [eax+7Ch]
	call	edx
	test	eax, eax
	jz		no_monster_or_stalker
	mov		edx, [ebp+8h]
	add		edx, 36h
	movzx	eax, word ptr [edx]
	push	eax             ; person_id
	call	RELATION_REGISTRY__ClearRelations
	
no_monster_or_stalker:
	; делаем вырезанное
	test	bl, bl
	mov		byte ptr [esi+84h], 0
	jmp	back_from_clear_relations_before_deleting
clear_relations_before_deleting endp

RELATION_REGISTRY__ClearRelations proc
rel_it          = dword ptr -8
_Where          = dword ptr -4
person_id       = word ptr  4

	sub     esp, 8
	push    ebx
	push    ebp
	push    esi
	push    edi
	mov     ebp, 1
	lea     esp, [esp+0]
look_in_next_object:
	call    RELATION_REGISTRY__relation_registry ; CRelationRegistryWrapper * RELATION_REGISTRY::relation_registry()
	mov     eax, [eax+4]
	push    ebp             ; id
	call    CALifeRegistryWrapper__objects_ptr ; CALifeRegistryWrapper<CALifeAbstractRegistry<ushort,RELATION_DATA>>::objects_ptr_no_insert(ushort)
	test    eax, eax
	jz      no_object_lets_see_next
	cmp     bp, [esp+18h+person_id]
	jnz     short this_is_not_deleting_object
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+4]
	call    eax
	; отладка
	movzx	eax, [esp+18h+person_id]
	PRINT_UINT "RELATIONS CLEARED FOR OBJECT %d", eax
	
	jmp     short no_object_lets_see_next

this_is_not_deleting_object:                           ; CODE XREF: RELATION_REGISTRY::ClearRelations(ushort)+ADj
	lea     esi, [eax+8]
	lea     ebx, [esp+18h+person_id] ; _Keyval
	lea     eax, [esp+18h+rel_it]
	mov     ecx, esi
	call    SRelation_map__find ; std::_Tree<std::_Tmap_traits<ushort,SRelation,std::less<ushort>,xalloc<std::pair<ushort,SRelation>>,0>>::find(ushort const &)
	mov     eax, dword ptr [esp+18h+rel_it]
	cmp     eax, [esi+4]
	jz      short no_object_lets_see_next
	push    eax			; what to delete
	lea     ecx, [esp+1Ch+_Where]
	push    ecx             ; last iterator
	push    esi             ; this
	call    SRelation_map__erase ; std::_Tree<std::_Tmap_traits<uint,CState<CAI_Boar> *,std::less<uint>,xalloc<std::pair<uint,CState<CAI_Boar> *>>,0>>::erase(std::_Tree_const_iterator<std::_Tree_val<std::_Tmap_traits<uint,CState<CAI_Boar> *,std::less<uint>,xalloc<std::pair<uint,CState<CAI_Boar> *>>,0>>>)
	PRINT_UINT "RELATIONS TO OBJECT ERASED FOR OBJECT %d", ebp

no_object_lets_see_next:
	inc     ebp
	mov     edx, 0FFFFh
	cmp     bp, dx
	jb      look_in_next_object
	pop     edi
	pop     esi
	pop     ebp
	pop     ebx
	add     esp, 8
	retn    4
RELATION_REGISTRY__ClearRelations endp

aDanger db "danger_", 0
aFree db "free_", 0

CALifeRegistryWrapper__objects_ptr_no_insert proc
	I               = dword ptr -4
	id              = word ptr  4

	push    ecx
	push    ebx             ; result
	push    esi             ; this
	mov     esi, eax
	call    CAI_Space__ai ; ai(void)
	cmp     dword ptr [eax+18h], 0
	jnz     short simulator_present
	lea     ecx, [esi+8]
	lea     ebx, [esp+0Ch+id] ; _Keyval
	lea     eax, [esp+0Ch+I]
	call    RELATION_DATA_map__find ; std::_Tree<std::_Tmap_traits<ushort,RELATION_DATA,std::less<ushort>,xalloc<std::pair<ushort,RELATION_DATA>>,0>>::find(ushort const &)
	mov     eax, dword ptr [esp+0Ch+I]
	cmp     eax, [esi+0Ch]
	jz      short no_object_found
	pop     esi
	add     eax, 10h
	pop     ebx
	pop     ecx
	retn    4

simulator_present: 
	call    CAI_Space__ai ; ai(void)
	mov     eax, [eax+18h]		; alife_simulator
	mov     ecx, [eax+0Ch]
	mov     edx, [eax+4]
	mov     eax, [edx+eax+3Ch]
	test    eax, eax
;	jz      short loc_1013B45D
	jz      short exit_from_here
	lea     esi, [eax+1Ch]
;	jmp     short register_container_present

;loc_1013B45D:
;	xor     esi, esi

register_container_present:
	lea     ecx, [esi+8]
	lea     ebx, [esp+0Ch+id] ; _Keyval
	lea     eax, [esp+0Ch+I]
	call    RELATION_DATA_map__find ; std::_Tree<std::_Tmap_traits<ushort,RELATION_DATA,std::less<ushort>,xalloc<std::pair<ushort,RELATION_DATA>>,0>>::find(ushort const &)
	mov     eax, dword ptr [esp+0Ch+I]
	cmp     eax, [esi+0Ch]
	jz      short no_object_found
	add     eax, 10h
	jnz     short exit_from_here

no_object_found:
	xor     eax, eax

exit_from_here:
	pop     esi
	pop     ebx
	pop     ecx
	retn    4
CALifeRegistryWrapper__objects_ptr_no_insert endp