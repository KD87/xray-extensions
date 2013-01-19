REGISTER_SAMPLER_CLF MACRO rt_name_str:REQ, sampler_name_str:REQ
LOCAL lab1
LOCAL rt_name
LOCAL sampler_name
	jmp		lab1
rt_name db rt_name_str, 0
sampler_name db sampler_name_str, 0
lab1:
	mov     edi, ds:CBlender_Compile__r_Sampler_clf
	push    0
	push    offset rt_name
	push    offset sampler_name
	mov     ecx, esi
	call	edi
ENDM

REGISTER_SAMPLER_CLW MACRO rt_name_str:REQ, sampler_name_str:REQ
LOCAL lab1
LOCAL rt_name
LOCAL sampler_name
	jmp		lab1
rt_name db rt_name_str, 0
sampler_name db sampler_name_str, 0
lab1:
	mov     edi, ds:CBlender_Compile__r_Sampler_clw
	push    0
	push    offset rt_name
	push    offset sampler_name
	mov     ecx, esi
	call	edi
ENDM

REGISTER_SAMPLER_RTF MACRO rt_name_str:REQ, sampler_name_str:REQ
LOCAL lab1
LOCAL rt_name
LOCAL sampler_name
	jmp		lab1
rt_name db rt_name_str, 0
sampler_name db sampler_name_str, 0
lab1:
	mov     edi, ds:CBlender_Compile__r_Sampler_rtf
	push    0
	push    offset rt_name
	push    offset sampler_name
	mov     ecx, esi
	call	edi
ENDM

REGISTER_SAMPLER_CUSTOM MACRO rt_name_str:REQ, sampler_name_str:REQ, projective_divide:REQ, address_mode:REQ, fmin:REQ, fmip:REQ, fmag:REQ
LOCAL lab1
LOCAL rt_name
LOCAL sampler_name
	jmp		lab1
rt_name db rt_name_str, 0
sampler_name db sampler_name_str, 0
lab1:
	mov     edi, ds:CBlender_Compile__r_Sampler
	push	fmag
	push	fmip
	push	fmin
	push	address_mode
	push    projective_divide
	push    offset rt_name
	push    offset sampler_name
	mov     ecx, esi
	call	edi
ENDM

