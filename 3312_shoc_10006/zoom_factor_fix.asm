zoom_factor_fix1 proc
	push    ecx
	mov     eax, [ecx+3ACh]
	cmp     eax, 2
	jnz     short loc_1021CAA5
	test    byte ptr [ecx+3A8h], 1
	jnz     short loc_1021CAAA

loc_1021CAA5:
	cmp     eax, 1
	jnz     short loc_1021CABC

loc_1021CAAA:
	movss   xmm0, dword ptr [ecx+3F0h]
	jmp		short final_calc

loc_1021CABC:
	movss   xmm0, dword ptr [ecx+3ECh]
	
final_calc:
	movss	xmm1, default_fov
	divss	xmm0, xmm1
	movss	xmm1, g_fov
	mulss	xmm0, xmm1
	movss   dword ptr [esp], xmm0
	fld     dword ptr [esp]
	pop     ecx
	retn
zoom_factor_fix1 endp

zoom_factor_fix2 proc
	movss	xmm3, dword ptr [ecx+3F0h]
	movss   xmm1, g_fov
	mulss	xmm3, xmm1
	movss	xmm1, default_fov
	divss	xmm3, xmm1
	movaps  xmm0, xmm1
	subss   xmm0, xmm3
	movaps  xmm2, xmm0
	mulss   xmm2, ds:dword_10459FB8
	mulss   xmm0, ds:dword_10459FAC
	mulss   xmm0, ds:dword_104D2410
	subss   xmm1, xmm2
	movss   xmm2, dword ptr [ecx+3E0h]
	subss   xmm2, xmm0
	movaps  xmm0, xmm2
	movss   dword ptr [ecx+3E0h], xmm2
	comiss  xmm3, xmm0
	jbe     short loc_102343DF
	movss   dword ptr [ecx+3E0h], xmm3
	retn

loc_102343DF:
	comiss  xmm0, xmm1
	jbe     short locret_102343EC
	movss   dword ptr [ecx+3E0h], xmm1

locret_102343EC:
	retn
zoom_factor_fix2 endp

zoom_factor_fix3 proc
	movss	xmm3, dword ptr [ecx+3F0h]
	movss   xmm1, g_fov
	mulss	xmm3, xmm1
	movss	xmm1, default_fov
	divss	xmm3, xmm1
	movaps  xmm0, xmm1
	subss   xmm0, xmm3
	movaps  xmm2, xmm0
	mulss   xmm0, ds:dword_10459FAC
	mulss   xmm2, ds:dword_10459FB8
	mulss   xmm0, ds:dword_104D2410
	addss   xmm0, dword ptr [ecx+3E0h]
	subss   xmm1, xmm2
	movss   dword ptr [ecx+3E0h], xmm0
	comiss  xmm3, xmm0
	jbe     short loc_10234448
	movss   dword ptr [ecx+3E0h], xmm3
	retn

loc_10234448:
	comiss  xmm0, xmm1
	jbe     short locret_10234455
	movss   dword ptr [ecx+3E0h], xmm1

locret_10234455:
	retn
zoom_factor_fix3 endp

zoom_factor_fix4 proc

	push    ecx
	mov     eax, [ecx+3B4h]
	cmp     eax, 2
	jnz     short loc_1022B404
	test    [ecx+3A8h], al
	jnz     short loc_1022B409

loc_1022B404:
	cmp     eax, 1
	jnz     short loc_1022B41A

loc_1022B409:
	cmp     byte ptr [ecx+958h], 0
	jz      short loc_1022B41A
	jmp		short loc_1022B445

loc_1022B41A:
	mov     eax, [ecx+3ACh]
	cmp     eax, 2
	jnz     short loc_1022B42E
	test    byte ptr [ecx+3A8h], 1
	jnz     short loc_1022B433

loc_1022B42E:
	cmp     eax, 1
	jnz     short loc_1022B445

loc_1022B433:
	movss   xmm0, dword ptr [ecx+3F0h]
	jmp		short final_calc

loc_1022B445:
	movss   xmm0, dword ptr [ecx+3ECh]
	
final_calc:
	movss	xmm1, default_fov
	divss	xmm0, xmm1
	movss	xmm1, g_fov
	mulss	xmm0, xmm1
	movss   dword ptr [esp], xmm0
	fld     dword ptr [esp]
	pop     ecx
	retn
zoom_factor_fix4 endp

default_fov dd 67.5

;---------------------------------------------------------------------------------------------------

; альтернативное окончание функции CActor::currentFOV
; подразумевая, что GetZoomFactor возвращает не абсолютное значение, а множитель,
; вместо того, чтобы домножить на 0.75, умножаем на g_fov
; 
__real_pi_div_180_mul_0_5_for_currentFOV_fix dd 0.00872664625997164788461845384 ;  ; (0.5 * pi / 180)
__real_2_0_for_currentFOV_fix dd 2.0

CActor__currentFOV_fix:
	movss   xmm0, dword ptr [esi+3E0h]
	; 2 * atan(tan(fov1/2) / sf) / (pi / 180)
	FLD     [g_fov]                                         ; st(0) = g_fov
	FMUL    [__real_pi_div_180_mul_0_5_for_currentFOV_fix]  ; st(0) = g_fov * (0.5 * pi / 180)
	FPTAN                                                   ; st(1) = tan(g_fov * (0.5 * pi / 180)), st(0) = 1.0
	FINCSTP ; смещаемся обратно на результат вычислениё     ; st(0) = tan(g_fov * (0.5 * pi / 180))
	FFREE   st(7)
	FLD     dword ptr [esi+3E0h]                            ; st(0) = fs
	FPATAN                                                  ; st(0) = atan(tan(g_fov * (0.5 * pi / 180)) / fs)
	FDIV    dword ptr [__real_pi_div_180_mul_0_5_for_currentFOV_fix]       ; / (0.5 * pi / 180)
	sub     esp, 4; резервируем место в стеке
	FSTP    dword ptr[esp] ; сохраняем в стек из регистра FPU с перемещением стека
	movss   xmm0, dword ptr[esp] ; читаем оттуда же в регистр xmm0
	add     esp, 4; вертаем стек на место
	pop     esi
	retn

; функции CWeaponBinoculars__ZoomInc и CWeaponBinoculars__ZoomDec заменяем полностью
; поскольку врезку делать сложно
CWeaponBinoculars__ZoomInc_fix proc
	movss   xmm1, [__real_1_0_for_zoom_fix] ; xmm1 = 1.0
	movaps  xmm0, xmm1                      ; xmm0 = xmm1
	subss   xmm0, dword ptr [ecx+3F0h]      ; xmm0 = delta_factor_total (1.0 - m_fScopeZoomFactor)
	movaps  xmm2, xmm0                      ; xmm2 = delta_factor_total
	mulss   xmm2, [__real_min_zoom_k]       ; xmm2 = delta_factor_total * min_zoom_k
	mulss   xmm0, [__real_1_sub_min_zoom_k] ; xmm0 = delta_factor_total * (1 - min_zoom_k)
	mulss   xmm0, [__real_1_div_zoom_step_count]; xmm0 = delta_factor_total * (1 - min_zoom_k) / zoom_step_count ====> delta
	subss   xmm1, xmm2                      ; xmm1 = 1.0 - delta_factor_total * min_zoom_k ====> min_zoom_factor
	; m_fZoomFactor = m_fZoomFactor + delta
	movss   xmm2, dword ptr [ecx+3E0h]      ; xmm2 = m_fZoomFactor
	addss   xmm2, xmm0                      ; xmm2 = m_fZoomFactor + delta
	movaps  xmm0, xmm2                      ; xmm0 = m_fZoomFactor
	movss   dword ptr [ecx+3E0h], xmm2      ; 
	jmp CWeaponBinoculars__ZoomInc_clamp
CWeaponBinoculars__ZoomInc_fix endp

CWeaponBinoculars__ZoomInc_clamp proc
	;; clamp(m_fZoomFactor, min_zoom_factor, m_fScopeZoomFactor)
	; clamp(m_fZoomFactor, m_fScopeZoomFactor, min_zoom_factor)
	movss   xmm2, dword ptr [ecx+3F0h]      ; xmm2 = m_fScopeZoomFactor
	comiss  xmm0, xmm2                      ; comparing
	jbe     short loc_1023471F              ; if m_fZoomFactor Below or Equal m_fScopeZoomFactor goto loc_1023471F
	movss   dword ptr [ecx+3E0h], xmm2      ; m_fZoomFactor = m_fScopeZoomFactor
	retn
loc_1023471F:
	comiss  xmm1, xmm0                       ; compare min_zoom_factor vs. m_fZoomFactor
	jbe     short locret_1023472C           ; if min_zoom_factor Below or Equal m_fZoomFactor goto locret_1023472C
	movss   dword ptr [ecx+3E0h], xmm1
locret_1023472C:
	retn
CWeaponBinoculars__ZoomInc_clamp endp
temp_temp_temp dd 0.0

__real_1_0_for_zoom_fix dd 1.0
__real_min_zoom_k dd 0.3  ; нижний порог увеличения относительно максимума (для бинокля и стволов на его основе)
; при включении увеличения в бинокль колесом можно будет менять от __real_min_zoom_k * m_fScopeZoomFactor до m_fScopeZoomFactor
__real_1_sub_min_zoom_k dd 0.7 ; должно быть равно 1 - __real_min_zoom_k
__real_1_div_zoom_step_count dd 0.2;0.333333333333333333 - 1/<число шагов от мин. до макс. масштабирования>. Для бинокля и основанного на нём оружия.

CWeaponBinoculars__ZoomDec_fix proc
	movss   xmm1, [__real_1_0_for_zoom_fix] ; xmm1 = 1.0
	movaps  xmm0, xmm1                      ; xmm0 = xmm1
	subss   xmm0, dword ptr [ecx+3F0h]      ; xmm0 = delta_factor_total (1.0 - m_fZoomFactor)
	movaps  xmm2, xmm0                      ; xmm2 = delta_factor_total
	mulss   xmm2, [__real_min_zoom_k]       ; xmm2 = delta_factor_total * min_zoom_k
	mulss   xmm0, [__real_1_sub_min_zoom_k] ; xmm0 = delta_factor_total * (1 - min_zoom_k)
	mulss   xmm0, [__real_1_div_zoom_step_count]; xmm0 = delta_factor_total * (1 - min_zoom_k) / zoom_step_count  ====> delta
	subss   xmm1, xmm2                      ; xmm1 = 1.0 - delta_factor_total * min_zoom_k                  ====> min_zoom_factor
	; m_fZoomFactor = m_fZoomFactor - delta
	movss   xmm2, dword ptr [ecx+3E0h]      ; xmm2 = m_fZoomFactor
	subss   xmm2, xmm0                      ; xmm2 = m_fZoomFactor - delta
	movaps  xmm0, xmm2                      ; xmm0 = m_fZoomFactor
	movss   dword ptr [ecx+3E0h], xmm2      ; 
	jmp CWeaponBinoculars__ZoomInc_clamp
CWeaponBinoculars__ZoomDec_fix endp

; вместо записи g_fov пишем 1.0
CWeapon__CWeapon_fov_fix proc
	movss   xmm0, [__real_1_0_for_zoom_fix]
	movss   dword ptr [edi+3E0h], xmm0
	jmp back_from_CWeapon__CWeapon_fov_fix
CWeapon__CWeapon_fov_fix endp

; аналогично. вместо записи g_fov пишем 1.0
CWeapon__OnZoomOut_fov_fix proc
	movss   xmm0, [__real_1_0_for_zoom_fix]
	mov     byte ptr [ecx+3F4h], 0
	movss   dword ptr [ecx+3E0h], xmm0
	mov     byte ptr [ecx+2B4h], 1
	retn
CWeapon__OnZoomOut_fov_fix endp
