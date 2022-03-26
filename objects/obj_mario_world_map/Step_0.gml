if(path_position < 1) {
	sprite_index = spr_mario_world_map_walk;
} else {
	sprite_index = spr_mario_world_map_idle;
}

if(direction == 180) {
	image_xscale = -1;
} else if(direction == 0) {
	image_xscale = 1;
}

depth = -400;