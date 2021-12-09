if(!activated) {
	if(path_position == 1) {
		sprite_index = spr_hammer_bros_opening_idle;
	} else {
		sprite_index = spr_hammer_bros_opening_walk;
	}
} else {
	y -= 4;
	x += 3;
	sprite_index = spr_hammer_bros_opening_hurt;
	image_angle -= 15;
}