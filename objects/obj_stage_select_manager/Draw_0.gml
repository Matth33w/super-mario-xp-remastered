draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(small_font);

switch(global.currentStage) {
	case 1: {
		draw_text(room_width / 2, room_height - 16, "Stage 1 - Castle Courtyard");
		global.lastRoom = stage_1_1;
		break;
	}
	
	case 2: {
		draw_text(room_width / 2, room_height - 16, "Stage 2 - Observation Tower");
		global.lastRoom = stage_2_1;
		break;
	}
	
	case 3: {
		draw_text(room_width / 2, room_height - 16, "Stage 3 - Underground Entrance");
		global.lastRoom = stage_3_1;
		break;
	}
	
	case 4: {
		draw_text(room_width / 2, room_height - 16, "Stage 4 - Underground Water Veins");
		global.lastRoom = stage_4_1;
		break;
	}
	
	case 5: {
		draw_text(room_width / 2, room_height - 16, "Stage 5 - Castle Main Building");
		break;
	}
	
	case 6: {
		draw_text(room_width / 2, room_height - 16, "Stage 6 - Clock Tower");
		break;
	}
	
	case 7: {
		draw_text(room_width / 2, room_height - 16, "Stage 7 - Top of the Castle");
		global.lastRoom = stage_7_1;
		break;
	}
}