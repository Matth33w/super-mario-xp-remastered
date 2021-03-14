if(instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y;
}

if(global.horizontal < 0) {
	image_xscale = -1;
} else if(global.horizontal > 0) {
	image_xscale = 1;
}

if(obj_player.onGround) {
	if(obj_player.isMoving) {
		sprite_index = spr_mario_walking;
	} else {
		if(global.vertical == 0) {
			sprite_index = spr_mario_idle;
		} else if(global.vertical < 0) {
			sprite_index = spr_mario_highjump;
		} else if(global.vertical > 0) {
			sprite_index = spr_mario_crouch;
		}
	}
} else if(!obj_player.onGround) {
	sprite_index = spr_mario_jumping;
}