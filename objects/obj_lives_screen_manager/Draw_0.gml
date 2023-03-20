switch(global.character) {
	case "mario": {
		draw_sprite(spr_mario_lives, 0, (room_width / 2) - 32, (room_height / 2));
		break;
	}
	
	case "luigi": {
		draw_sprite(spr_luigi_lives, 0, (room_width / 2) - 32, (room_height / 2));
		break;
	}
}
draw_set_font(global.livesFont);

draw_text((room_width / 2) + 32, (room_height / 2) - 3, global.playerLives);