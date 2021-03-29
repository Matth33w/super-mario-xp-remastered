draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(small_font);

switch(global.currentStage) {
	case 1: {
		draw_text(room_width / 2, room_height - 16, "STAGE 1 - Castle Courtyard");
		global.lastRoom = stage_1_1;
		break;
	}
	
	case 2: {
		draw_text(room_width / 2, room_height - 16, "STAGE 2 - Observation Tower");
		break;
	}
	
	case 3: {
		draw_text(room_width / 2, room_height - 16, "STAGE 3 - Underground Entrance");
		break;
	}
	
	case 4: {
		draw_text(room_width / 2, room_height - 16, "STAGE 4 - Underground Water Veins");
		break;
	}
	
	case 5: {
		draw_text(room_width / 2, room_height - 16, "STAGE 5 - Castle Main Building");
		break;
	}
	
	case 6: {
		draw_text(room_width / 2, room_height - 16, "STAGE 6 - Clock Tower");
		break;
	}
	
	case 7: {
		draw_text(room_width / 2, room_height - 16, "STAGE 7 - Top of the Castle");
		break;
	}
}