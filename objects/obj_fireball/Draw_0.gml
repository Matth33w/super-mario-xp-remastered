switch(emitter) {
	case "mario": {
		draw_sprite_ext(spr_fireball, 0, x, y, 1, 1, currentAngle, c_white, 1);
		break;
	}
	
	case "luigi": {
		draw_sprite_ext(spr_luigi_fireball, 0, x, y, 1, 1, currentAngle, c_white, 1);
		break;
	}
}