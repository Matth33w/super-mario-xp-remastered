if(instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y;
	
	if(global.horizontal < 0 && !obj_player.hitState) {
		image_xscale = -1;
	} else if(global.horizontal > 0 && !obj_player.hitState) {
		image_xscale = 1;
	}

	if(obj_player.onGround && !obj_player.hitState) {
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
	} else if(!obj_player.onGround && !obj_player.hitState) {
		sprite_index = spr_mario_jumping;
	}

	if(obj_player.hitState)
		sprite_index = spr_mario_damage;
		
	if(obj_player.invincibilityState){
		spriteFlashingTimeout += delta_time / 1000000;
		if(spriteFlashingTimeout > spriteFlasingMax) {
			spriteFlashing = !spriteFlashing;
			spriteFlashingTimeout = 0;
		}
	} else {
		spriteFlashing = false;
	}
}

if(spriteFlashing) {
	image_alpha = 0;
} else {
	image_alpha = 1;
}