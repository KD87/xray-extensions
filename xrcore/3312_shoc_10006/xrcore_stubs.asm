;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 10018640h - shift
Msg:

org 1001CBE6h - shift
	jmp		texture_load_fix
	
org 1001CBEBh - shift
back_from_texture_load_fix: