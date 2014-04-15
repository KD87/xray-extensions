b_addr TEXTEQU <10000000h>
sec1_rva TEXTEQU <1000h>
sec2_rva TEXTEQU <150000h>
sec1_addr EQU (b_addr + sec1_rva)
shift EQU sec1_addr
sec2_addr EQU (b_addr + sec2_rva)
sec1_sec2_dist EQU (sec2_rva - sec1_rva)
