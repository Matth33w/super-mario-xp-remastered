if(instance_exists(obj_player)) {
	if(!obj_player.hitState && obj_player.canMove) {
		image_xscale = obj_player.lastHorizontalDirection;
	}

	if(obj_player.onGround && !obj_player.hitState && obj_player.canMove && !obj_player.attacking && !obj_player.warpState) {
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
	} else if(!obj_player.onGround && !obj_player.hitState && obj_player.canMove && !obj_player.attacking && !obj_player.warpState) {
		sprite_index = spr_mario_jumping;
	}

	if(obj_player.hitState)
		sprite_index = spr_mario_damage;
		
	if(obj_player.attacking)
		sprite_index = spr_mario_attack;
		
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