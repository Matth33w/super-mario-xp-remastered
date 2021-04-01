function set_soundtrack(soundtrack){
	switch(soundtrack) {
		case "remastered": {
			global.bgm_stage1 = bgm_stage1_remaster;
			global.bgm_stage2 = bgm_stage2_remaster;
			global.bgm_stage3 = bgm_stage3_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7_remaster;
			break;
		}
		
		default: {
			
		}
	}
}