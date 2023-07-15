function set_soundtrack(soundtrack){
	switch(soundtrack) {
		case "remastered": {
			global.bgm_stage_intro = bgm_stage_intro_remaster;
			global.bgm_stage1 = bgm_stage1_remaster;
			global.bgm_stage2 = bgm_stage2_remaster;
			global.bgm_stage3 = bgm_stage3_remaster;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7;
			global.bgm_preboss = bgm_preboss_remaster;
			global.bgm_boss_intro = bgm_boss_intro_remaster;
			global.bgm_boss_loop = bgm_boss_loop_remaster;
			global.bgm_boss_defeated = bgm_boss_defeated;
			global.bgm_boss2 = bgm_boss_2_remaster;
			global.bgm_death_jingle = bgm_death_jingle_remaster;
			break;
		}
		
		case "luigi": {
			global.bgm_stage1 = bgm_stage1_luigi;
			global.bgm_stage2 = bgm_stage2_remaster;
			global.bgm_stage3 = bgm_stage3_remaster;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7_remaster;
			global.bgm_boss2 = bgm_boss_2_remaster;
			global.bgm_death_jingle = bgm_death_jingle_remaster;
			break;
		}
		
		case "snes": {
			global.bgm_stage_intro = bgm_stage_intro_snes;
			global.bgm_stage1 = bgm_stage1_snes;
			global.bgm_stage2 = bgm_stage2_snes;
			global.bgm_stage3 = bgm_stage3_snes;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6_remaster;
			global.bgm_stage7 = bgm_stage7_snes;
			global.bgm_preboss = bgm_preboss_snes;
			global.bgm_boss_intro = bgm_boss_intro_snes_alternative;
			global.bgm_boss_loop = bgm_boss_loop_snes_alternative;
			global.bgm_boss_defeated = bgm_boss_defeated_snes;
			global.bgm_boss2 = bgm_stage7_snes;
			global.bgm_death_jingle = bgm_death_jingle_snes;
			break;
		}
		
		case "original": {
			global.bgm_stage_intro = bgm_stage_intro;
			global.bgm_stage1 = bgm_stage1;
			global.bgm_stage2 = bgm_stage2;
			global.bgm_stage3 = bgm_stage3;
			global.bgm_stage3_alt = bgm_stage3_alt_remaster;
			global.bgm_stage4 = bgm_stage4_remaster;
			global.bgm_stage5 = bgm_stage5_remaster;
			global.bgm_stage6 = bgm_stage6;
			global.bgm_stage7 = bgm_stage7;
			global.bgm_preboss = bgm_preboss;
			global.bgm_boss_intro = bgm_boss_intro_remaster;
			global.bgm_boss_loop = bgm_boss_loop_remaster;
			global.bgm_boss_defeated = bgm_boss_defeated;
			global.bgm_boss2 = bgm_stage7;
			global.bgm_death_jingle = bgm_death_jingle;
			break;
		}
	}
}