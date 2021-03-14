draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_sprite(spr_new_game, 0, (room_width / 2), 170);
draw_sprite(spr_stage_select, 0, (room_width / 2), 190);
draw_sprite(spr_options, 0, (room_width / 2), 210);

draw_sprite(spr_copyright, 0, (room_width / 2), 230);

switch(currentOption) {
	case 1: {
		draw_sprite_ext(menu_cursor, image_index, (room_width / 2), 170, 1, 1, 0, c_white, 1);
		break;
	}
	
	case 2: {
		draw_sprite_ext(menu_cursor, image_index, (room_width / 2), 190, 1, 1, 0, c_white, 1);
		break;
	}
	
	case 3: {
		draw_sprite_ext(menu_cursor, image_index, (room_width / 2), 210, 1, 1, 0, c_white, 1);
		break;
	}
}