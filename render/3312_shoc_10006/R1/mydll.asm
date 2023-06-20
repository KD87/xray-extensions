.686
.XMM

.model flat,  C

include addr.inc

_CODE segment byte public 'CODE' use32
	assume cs:_CODE
	assume ds:_CODE
; �������� ��� ����������
LibMain proc STDCALL instance:DWORD,reason:DWORD,unused:DWORD 
    ret
LibMain ENDP

; ������� �� ������� ����
include xrrender_r1_stubs.asm

; ������� � ��� �����, ��� � ������� DLL ���������� ���� ������
org sec1_sec2_dist

include misc.asm
include console_comm_reg_macro.asm
include console_comm.asm
include detail_radius_fix.asm
include detail_density_fix.asm
include mip_bias_fix.asm
include bloodmarks.asm
include sun_near_fix.asm
	
_CODE ENDS

end LibMain

