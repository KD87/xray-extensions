combine_2_sampler_register:
	mov     ecx, esi
	call    edi ; CBlender_Compile::r_Sampler_clf(char const *,char const *,bool) ; CBlender_Compile::r_Sampler_clf(char const *,char const *,bool)

REGISTER_SAMPLER_CUSTOM "$user$jitter_0", "s_jitter_0", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "$user$jitter_1", "s_jitter_1", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "$user$jitter_5", "s_jitter_5", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "ogse\effects\rain_drops", "s_rain_drops", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "ogse\effects\rain_drops_streaks", "s_rain_drops_streaks", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "ogse\effects\rain_drops_scroll", "s_rain_drops_scroll", 0, 1, 2, 0, 2

	mov     ecx, esi
	jmp back_to_combine_2_sampler_register
