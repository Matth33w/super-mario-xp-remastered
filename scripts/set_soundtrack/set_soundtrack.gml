function set_soundtrack(soundtrack){
	switch(soundtrack) {
		case "remastered": {
			global.bgm_stage1 = bgm_stage1_remaster;
			global.bgm_stage2 = bgm_stage2_remaster;
			global.bgm_stage3 = bgm_stage3_remaster;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7_remaster;
			break;
		}
		
		case "snes": {
			global.bgm_stage1 = bgm_stage1_snes;
			global.bgm_stage2 = bgm_stage2_remaster;
			global.bgm_stage3 = bgm_stage3_snes;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7_remaster;
			break;
		}
		
		case "original": {
			global.bgm_stage1 = bgm_stage1;
			global.bgm_stage2 = bgm_stage2_remaster;
			global.bgm_stage3 = bgm_stage3;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7_remaster;
			break;
		}
	}
}