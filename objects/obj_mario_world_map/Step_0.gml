if(path_position < 1) {
	switch(global.character) {
		case "mario": {
			sprite_index = spr_mario_world_map_walk;
			break;
		}
		
		case "luigi": {
			sprite_index = spr_luigi_world_map_walk;
			break;
		}
	}
} else {
	switch(global.character) {
		case "mario": {
			sprite_index = spr_mario_world_map_idle;
			break;
		}
		
		case "luigi": {
			sprite_index = spr_luigi_world_map_idle;
			break;
		}
	}
}

if(direction == 180) {
	image_xscale = -1;
} else if(direction == 0) {
	image_xscale = 1;
}

depth = -400;