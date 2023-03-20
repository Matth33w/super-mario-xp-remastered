draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(small_font);

switch(global.currentStage) {
	case 1: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-1 Castle Courtyard");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-1 Entrada do Castelo");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-1 恶魔城入口");
				break;
			}
		}
		global.lastRoom = stage_1_1;
		global.initialWarping = false;
		break;
	}
	
	case 2: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-2 Observation Tower");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-2 Torre de Observação");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-2 監視塔");
				break;
			}
		}
		global.lastRoom = stage_2_1;
		global.initialWarping = false;
		break;
	}
	
	case 3: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-3 Underground Entrance");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-3 Entrada ao Subterrâneo");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-3 空中庭園~礼拜堂");
				break;
			}
		}
		global.lastRoom = stage_3_1;
		global.initialWarping = false;
		break;
	}
	
	case 4: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-4 Underground Water Veins");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-4 Fontes Subterrâneas");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-4 地下水脈");
				break;
			}
		}
		global.lastRoom = stage_4_1;
		global.initialWarping = false;
		break;
	}
	
	case 5: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-5 Castle Main Building");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-5 Construção Principal");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-5 悪魔城本館");
				break;
			}
		}
		global.lastRoom = stage_5_1;
		global.initialWarping = false;
		break;
	}
	
	case 6: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-6 Clock Tower");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-6 Torre do Relógio");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-6 時計塔");
				break;
			}
		}
		global.lastRoom = stage_6_1;
		global.startX = 80;
		global.startY = 208;

		global.initialWarping = true;
		global.initialWarpDirection = "up";
		break;
	}
	
	case 7: {
		switch(global.language) {
			case "eng": {
				draw_text(room_width / 2, room_height - 16, "STAGE-7 Top of the Castle");
				break;
			}
			
			case "ptbr": {
				draw_text(room_width / 2, room_height - 16, "STAGE-7 Topo do Castelo");
				break;
			}
			
			case "jp": {
				draw_text(room_width / 2, room_height - 16, "STAGE-7 悪魔城最上部");
				break;
			}
		}
		global.lastRoom = stage_7_1;
		global.initialWarping = false;
		break;
	}
}

draw_sprite(spr_fade_out_stage, 0, fadeOutPos, 0);