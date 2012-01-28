include matrix_reg_macro.asm

REGISTER__MATRIX__PMATR_PMATR register__matrix__mul43, "mul_43"

matrix_fix proc
	; делаем вырезанное
	call    register__matrix_div_number
	; делаем своё
PERFORM_EXPORT__MATRIX__PMATR__FLOAT matrix__set_xform, "set_xform"
PERFORM_EXPORT__MATRIX__PMATR__FLOAT matrix__transpose, "transpose"
PERFORM_EXPORT__MATRIX__PMATR_PMATR register__matrix__mul43, matrix__mul_43
	; идём обратно
	jmp back_from_matrix_fix
matrix_fix endp

matrix__set_xform proc near
arg_0           = dword ptr  4

	;call CScriptGameObject__IsSpaceRestrictor
	mov     eax, [esp+arg_0]
	mov   dword ptr [ecx+0], eax
	mov   dword ptr [ecx+4], eax
	mov   dword ptr [ecx+8], eax
	mov   dword ptr [ecx+0Ch], eax
	mov   dword ptr [ecx+10h], eax
	mov   dword ptr [ecx+14h], eax
	mov   dword ptr [ecx+18h], eax
	mov   dword ptr [ecx+1Ch], eax
	mov   dword ptr [ecx+20h], eax
	mov   dword ptr [ecx+24h], eax
	mov   dword ptr [ecx+28h], eax
	mov   dword ptr [ecx+2Ch], eax
	mov   dword ptr [ecx+30h], eax
	mov   dword ptr [ecx+34h], eax
	mov   dword ptr [ecx+38h], eax
	mov   dword ptr [ecx+3Ch], eax
	retn    4
matrix__set_xform endp

matrix__set_m   proc near

arg_0           = dword ptr  4
v00 = dword ptr  00h
v01 = dword ptr  04h
v02 = dword ptr  08h
v03 = dword ptr  0Ch
v10 = dword ptr  10h
v11 = dword ptr  14h
v12 = dword ptr  18h
v13 = dword ptr  1Ch
v20 = dword ptr  20h
v21 = dword ptr  24h
v22 = dword ptr  28h
v23 = dword ptr  2Ch
v30 = dword ptr  30h
v31 = dword ptr  34h
v32 = dword ptr  38h
v33 = dword ptr  3Ch
	mov     eax, ecx
	mov     ecx, [esp+arg_0]
	fld     dword ptr [ecx]
	fstp    dword ptr [eax]
	fld     dword ptr [ecx+4]
	fstp    dword ptr [eax+4]
	fld     dword ptr [ecx+8]
	fstp    dword ptr [eax+8]
	fld     dword ptr [ecx+0Ch]
	fstp    dword ptr [eax+0Ch]
	fld     dword ptr [ecx+10h]
	fstp    dword ptr [eax+10h]
	fld     dword ptr [ecx+14h]
	fstp    dword ptr [eax+14h]
	fld     dword ptr [ecx+18h]
	fstp    dword ptr [eax+18h]
	fld     dword ptr [ecx+1Ch]
	fstp    dword ptr [eax+1Ch]
	fld     dword ptr [ecx+20h]
	fstp    dword ptr [eax+20h]
	fld     dword ptr [ecx+24h]
	fstp    dword ptr [eax+24h]
	fld     dword ptr [ecx+28h]
	fstp    dword ptr [eax+28h]
	fld     dword ptr [ecx+2Ch]
	fstp    dword ptr [eax+2Ch]
	fld     dword ptr [ecx+30h]
	fstp    dword ptr [eax+30h]
	fld     dword ptr [ecx+34h]
	fstp    dword ptr [eax+34h]
	fld     dword ptr [ecx+38h]
	fstp    dword ptr [eax+38h]
	fld     dword ptr [ecx+3Ch]
	fstp    dword ptr [eax+3Ch]
	retn    4
matrix__set_m   endp

ALIGN_8
matrix__mul_43 proc
	push        ebp  
	mov         ebp,esp  
	mov         edx,dword ptr [ebp+8]  
	fld         dword ptr [edx]  
	push        esi  
	mov         esi,dword ptr [ebp+0Ch]  
	fmul        dword ptr [esi]  
	mov         eax,ecx  
	fld         dword ptr [edx+10h]  
	fmul        dword ptr [esi+4]  
	faddp       st(1),st  
	fld         dword ptr [edx+20h]  
	fmul        dword ptr [esi+8]  
	faddp       st(1),st  
	fstp        dword ptr [eax]  
	fld         dword ptr [edx+14h]  
	fmul        dword ptr [esi+4]  
	fld         dword ptr [edx+4]  
	fmul        dword ptr [esi]  
	faddp       st(1),st  
	fld         dword ptr [esi+8]  
	fmul        dword ptr [edx+24h]  
	faddp       st(1),st  
	fstp        dword ptr [eax+4]  
	fld         dword ptr [edx+18h]  
	fmul        dword ptr [esi+4]  
	fld         dword ptr [edx+8]  
	fmul        dword ptr [esi]  
	faddp       st(1),st  
	fld         dword ptr [esi+8]  
	fmul        dword ptr [edx+28h]  
	faddp       st(1),st  
	fstp        dword ptr [eax+8]  
	fld         dword ptr [edx+20h]  
	fmul        dword ptr [esi+18h]  
	fld         dword ptr [esi+10h]  
	fmul        dword ptr [edx]  
	faddp       st(1),st  
	fld         dword ptr [edx+10h]  
	fmul        dword ptr [esi+14h]  
	faddp       st(1),st  
	fstp        dword ptr [eax+10h]  
	fld         dword ptr [esi+18h]  
	fmul        dword ptr [edx+24h]  
	fld         dword ptr [edx+14h]  
	fmul        dword ptr [esi+14h]  
	faddp       st(1),st  
	fld         dword ptr [edx+4]  
	fmul        dword ptr [esi+10h]  
	faddp       st(1),st  
	fstp        dword ptr [eax+14h]  
	fld         dword ptr [esi+18h]  
	fmul        dword ptr [edx+28h]  
	fld         dword ptr [edx+18h]  
	fmul        dword ptr [esi+14h]  
	faddp       st(1),st  
	fld         dword ptr [edx+8]  
	fmul        dword ptr [esi+10h]  
	faddp       st(1),st  
	fstp        dword ptr [eax+18h]  
	fld         dword ptr [edx+20h]  
	fmul        dword ptr [esi+28h]  
	fld         dword ptr [esi+20h]  
	fmul        dword ptr [edx]  
	faddp       st(1),st  
	fld         dword ptr [esi+24h]  
	fmul        dword ptr [edx+10h]  
	faddp       st(1),st  
	fstp        dword ptr [eax+20h]  
	fld         dword ptr [esi+28h]  
	fmul        dword ptr [edx+24h]  
	fld         dword ptr [edx+14h]  
	fmul        dword ptr [esi+24h]  
	faddp       st(1),st  
	fld         dword ptr [esi+20h]  
	fmul        dword ptr [edx+4]  
	faddp       st(1),st  
	fstp        dword ptr [eax+24h]  
	fld         dword ptr [esi+28h]  
	fmul        dword ptr [edx+28h]  
	fld         dword ptr [edx+18h]  
	fmul        dword ptr [esi+24h]  
	faddp       st(1),st  
	fld         dword ptr [esi+20h]  
	fmul        dword ptr [edx+8]  
	faddp       st(1),st  
	fstp        dword ptr [eax+28h]  
	fld         dword ptr [esi+38h]  
	fmul        dword ptr [edx+20h]  
	fld         dword ptr [esi+30h]  
	fmul        dword ptr [edx]  
	faddp       st(1),st  
	fld         dword ptr [esi+34h]  
	fmul        dword ptr [edx+10h]  
	faddp       st(1),st  
	fadd        dword ptr [edx+30h]  
	fstp        dword ptr [eax+30h]  
	fld         dword ptr [esi+38h]  
	fmul        dword ptr [edx+24h]  
	fld         dword ptr [edx+14h]  
	fmul        dword ptr [esi+34h]  
	faddp       st(1),st  
	fld         dword ptr [esi+30h]  
	fmul        dword ptr [edx+4]  
	faddp       st(1),st  
	fadd        dword ptr [edx+34h]  
	fstp        dword ptr [eax+34h]  
	fld         dword ptr [esi+38h]  
	fmul        dword ptr [edx+28h]  
	fld         dword ptr [edx+18h]  
	fmul        dword ptr [esi+34h]  
	faddp       st(1),st  
	fld         dword ptr [esi+30h]  
	pop         esi  
	fmul        dword ptr [edx+8]  
	faddp       st(1),st  
	fadd        dword ptr [edx+38h]  
	fstp        dword ptr [eax+38h]  
	fldz  
	fst         dword ptr [eax+0Ch]  
	fst         dword ptr [eax+1Ch]  
	fstp        dword ptr [eax+2Ch]  
	fld1  
	fstp        dword ptr [eax+3Ch]  
	pop         ebp  
	ret         8  
matrix__mul_43 endp	
	
matrix__mul_43_xmm proc
m1              = dword ptr  8
m2              = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	mov     edx, [ebp+m1]
	movss   xmm0, dword ptr [edx]
	cvtps2pd xmm0, xmm0
	push    esi
	mov     esi, [ebp+m2]
	movss   xmm1, dword ptr [esi]
	movss   xmm2, dword ptr [esi+4]
	cvtps2pd xmm1, xmm1
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+10h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+20h]
	movss   xmm2, dword ptr [esi+8]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	mov     eax, ecx
	movss   dword ptr [eax], xmm0
	movss   xmm0, dword ptr [edx+14h]
	movss   xmm1, dword ptr [esi+4]
	movss   xmm2, dword ptr [esi]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+4]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [edx+24h]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+8]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+4], xmm0
	movss   xmm0, dword ptr [edx+18h]
	movss   xmm1, dword ptr [esi+4]
	movss   xmm2, dword ptr [esi]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+8]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [edx+28h]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+8]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+8], xmm0
	movss   xmm0, dword ptr [edx+20h]
	movss   xmm1, dword ptr [esi+18h]
	movss   xmm2, dword ptr [edx]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+10h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [esi+14h]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+10h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+10h], xmm0
	movss   xmm0, dword ptr [esi+18h]
	movss   xmm1, dword ptr [edx+24h]
	movss   xmm2, dword ptr [esi+14h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+14h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+4]
	movss   xmm2, dword ptr [esi+10h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+14h], xmm0
	movss   xmm0, dword ptr [esi+18h]
	movss   xmm1, dword ptr [edx+28h]
	movss   xmm2, dword ptr [esi+14h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+18h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+8]
	movss   xmm2, dword ptr [esi+10h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+18h], xmm0
	movss   xmm0, dword ptr [edx+20h]
	movss   xmm1, dword ptr [esi+28h]
	movss   xmm2, dword ptr [edx]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+20h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [edx+10h]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+24h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+20h], xmm0
	movss   xmm0, dword ptr [esi+28h]
	movss   xmm1, dword ptr [edx+24h]
	movss   xmm2, dword ptr [esi+24h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+14h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [edx+4]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+20h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+24h], xmm0
	movss   xmm0, dword ptr [esi+28h]
	movss   xmm1, dword ptr [edx+28h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+18h]
	movss   xmm2, dword ptr [esi+24h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+20h]
	movss   xmm2, dword ptr [edx+8]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+28h], xmm0
	movss   xmm0, dword ptr [esi+38h]
	movss   xmm1, dword ptr [edx+20h]
	movss   xmm2, dword ptr [edx]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+30h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+34h]
	movss   xmm2, dword ptr [edx+10h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+30h]
	cvtps2pd xmm1, xmm1
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+30h], xmm0
	movss   xmm0, dword ptr [esi+38h]
	movss   xmm1, dword ptr [edx+24h]
	movss   xmm2, dword ptr [esi+34h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+14h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [edx+4]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+30h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+34h]
	cvtps2pd xmm1, xmm1
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+34h], xmm0
	movss   xmm0, dword ptr [esi+38h]
	movss   xmm1, dword ptr [edx+28h]
	movss   xmm2, dword ptr [esi+34h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm0, xmm0
	mulsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+18h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	movss   xmm2, dword ptr [edx+8]
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [esi+30h]
	cvtps2pd xmm1, xmm1
	cvtps2pd xmm2, xmm2
	mulsd   xmm1, xmm2
	addsd   xmm0, xmm1
	movss   xmm1, dword ptr [edx+38h]
	cvtps2pd xmm1, xmm1
	addsd   xmm0, xmm1
	cvtpd2ps xmm0, xmm0
	movss   dword ptr [eax+38h], xmm0
	xorps   xmm0, xmm0
	movss   dword ptr [eax+0Ch], xmm0
	movss   dword ptr [eax+1Ch], xmm0
	movss   dword ptr [eax+2Ch], xmm0
	movss   xmm0, dword ptr ds:value_1_0
	movss   dword ptr [eax+3Ch], xmm0
	pop     esi
	pop     ebp
	retn    8
matrix__mul_43_xmm endp

matrix__mul_43_  proc near
arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi

	mov     edx, [ebp+arg_0]
	mov     esi, [ebp+arg_4]
	mov     eax, ecx
	xor     ecx, ecx
	
	fld     dword ptr [edx]
	fmul    dword ptr [esi]
	fld     dword ptr [edx+10h]
	fmul    dword ptr [esi+4]
	faddp   st(1), st
	fld     dword ptr [esi+8]
	fmul    dword ptr [edx+20h]
	faddp   st(1), st
	fstp    dword ptr [eax]
	fld     dword ptr [edx+14h]
	fmul    dword ptr [esi+4]
	fld     dword ptr [edx+4]
	fmul    dword ptr [esi]
	faddp   st(1), st
	fld     dword ptr [edx+24h]
	fmul    dword ptr [esi+8]
	faddp   st(1), st
	fstp    dword ptr [eax+4]
	fld     dword ptr [edx+18h]
	fmul    dword ptr [esi+4]
	fld     dword ptr [edx+8]
	fmul    dword ptr [esi]
	faddp   st(1), st
	fld     dword ptr [edx+28h]
	fmul    dword ptr [esi+8]
	faddp   st(1), st
	fstp    dword ptr [eax+8]
	fld     dword ptr [edx]
	fmul    dword ptr [esi+10h]
	fld     dword ptr [edx+10h]
	fmul    dword ptr [esi+14h]
	faddp   st(1), st
	fld     dword ptr [edx+20h]
	fmul    dword ptr [esi+18h]
	faddp   st(1), st
	fstp    dword ptr [eax+10h]
	fld     dword ptr [edx+24h]
	fmul    dword ptr [esi+18h]
	fld     dword ptr [edx+14h]
	fmul    dword ptr [esi+14h]
	faddp   st(1), st
	fld     dword ptr [edx+4]
	fmul    dword ptr [esi+10h]
	faddp   st(1), st
	fstp    dword ptr [eax+14h]
	fld     dword ptr [edx+28h]
	fmul    dword ptr [esi+18h]
	fld     dword ptr [edx+18h]
	fmul    dword ptr [esi+14h]
	faddp   st(1), st
	fld     dword ptr [edx+8]
	fmul    dword ptr [esi+10h]
	faddp   st(1), st
	fstp    dword ptr [eax+18h]
	fld     dword ptr [edx]
	fmul    dword ptr [esi+20h]
	fld     dword ptr [edx+10h]
	fmul    dword ptr [esi+24h]
	faddp   st(1), st
	fld     dword ptr [edx+20h]
	fmul    dword ptr [esi+28h]
	faddp   st(1), st
	fstp    dword ptr [eax+20h]
	fld     dword ptr [edx+24h]
	fmul    dword ptr [esi+28h]
	fld     dword ptr [edx+14h]
	fmul    dword ptr [esi+24h]
	faddp   st(1), st
	fld     dword ptr [edx+4]
	fmul    dword ptr [esi+20h]
	faddp   st(1), st
	fstp    dword ptr [eax+24h]
	fld     dword ptr [edx+28h]
	fmul    dword ptr [esi+28h]
	fld     dword ptr [edx+18h]
	fmul    dword ptr [esi+24h]
	faddp   st(1), st
	fld     dword ptr [edx+8]
	fmul    dword ptr [esi+20h]
	faddp   st(1), st
	fstp    dword ptr [eax+28h]
	fld     dword ptr [edx]
	fmul    dword ptr [esi+30h]
	fld     dword ptr [edx+10h]
	fmul    dword ptr [esi+34h]
	faddp   st(1), st
	fld     dword ptr [esi+38h]
	fmul    dword ptr [edx+20h]
	faddp   st(1), st
	fadd    dword ptr [edx+30h]
	fstp    dword ptr [eax+30h]
	fld     dword ptr [edx+24h]
	fmul    dword ptr [esi+38h]
	fld     dword ptr [edx+14h]
	fmul    dword ptr [esi+34h]
	faddp   st(1), st
	fld     dword ptr [edx+4]
	fmul    dword ptr [esi+30h]
	faddp   st(1), st
	fadd    dword ptr [edx+34h]
	fstp    dword ptr [eax+34h]
	fld     dword ptr [edx+28h]
	fmul    dword ptr [esi+38h]
	fld     dword ptr [edx+18h]
	fmul    dword ptr [esi+34h]
	faddp   st(1), st
	fld     dword ptr [edx+8]
	fmul    dword ptr [esi+30h]
	faddp   st(1), st
	fadd    dword ptr [edx+38h]
	fstp    dword ptr [eax+38h]

	;mov     [eax+0Ch], ecx
	fldz
	fstp    dword ptr [eax+0Ch]
	
	;mov     [eax+1Ch], ecx
	fldz
	fstp    dword ptr [eax+1Ch]
	
	;mov     [eax+2Ch], ecx
	fldz
	fstp    dword ptr [eax+2Ch]
	
	;mov     esi, dword ptr [value_1_0]
	;mov     dword ptr [eax+3Ch], esi
	fld     value_1_0
	fstp    dword ptr [eax+3Ch]
	
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    8
matrix__mul_43_  endp

value_1_0 dd 1.0

SWAP_MATR_CELLS MACRO r1:REQ, c1:REQ, r2:REQ, c2:REQ
	mov   eax, dword ptr [ecx+((r1-1)*4 + c1 - 1) * 4]
	mov   edx, dword ptr [ecx+((r2-1)*4 + c2 - 1) * 4]
	mov   dword ptr [ecx+((r1-1)*4 + c1 - 1) * 4], edx
	mov   dword ptr [ecx+((r2-1)*4 + c2 - 1) * 4], eax
ENDM

matrix__transpose proc near
;arg_0           = dword ptr  4
	push eax
	push edx
	SWAP_MATR_CELLS 1,2, 2,1
	SWAP_MATR_CELLS 1,3, 3,1
	SWAP_MATR_CELLS 2,3, 3,2
	pop edx
	pop eax
	retn    4
matrix__transpose endp

