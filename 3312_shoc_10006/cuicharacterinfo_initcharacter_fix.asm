; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
; ���� ������� ��������� �� ������� "�����"
CUICharacterInfo__InitCharacter_fix:
	; ������ ����
	; ��������� �����
	push	225 ; B
	push	190 ; G
	push	190 ; R
	push	255 ; A
	mov     ecx, esi ; wnd
	call    CUIStatic__SetTextColor_script
	; SetTextComplexMode(true)
	push    1 ; bool
	mov     edi, esi ; wnd
	call	CUIStatic__SetTextComplexMode
	; ������ �� ��� ��������
	call    CUIStatic__AdjustHeightToText
	; ������������
	jmp     back_from_CUICharacterInfo__InitCharacter_fix
; =========================================================================================
; ======================================= END =============================================
; =========================================================================================
