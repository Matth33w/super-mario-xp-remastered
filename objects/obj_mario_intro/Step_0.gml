if(obj_opening_manager.openingTimeout > 9 && !pathAdded) {
	pathAdded = true;
	path_start(path_mario_intro, 7, path_action_stop, false);
}

if(path_position > 0.5 && obj_opening_manager.openingTimeout < 14) {
	switch(global.character) {
		case "mario": {
			sprite_index = spr_mario_walking;
			break;
		}
		
		case "luigi": {
			sprite_index = spr_luigi_walking;
			break;
		}
	}
	image_speed = 3;
}

if(path_position == 1 && obj_opening_manager.openingTimeout < 14) {
	switch(global.character) {
		case "mario": {
			sprite_index = spr_mario_idle;
			break;
		}
		
		case "luigi": {
			sprite_index = spr_luigi_idle;
			break;
		}
	}
	image_speed = 1;
}