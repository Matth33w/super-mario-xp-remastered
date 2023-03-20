if(!global.playerDead && instance_exists(obj_player)) {
	if(!instance_exists(obj_boss_1_wings)) {
		instance_create_layer(x, y, "Objects", obj_boss_1_wings);
	}
	
	animationTimeout += delta_time / 1000000;
	
	if(onGround)
		onGroundTimeout += delta_time / 1000000;
	
	if(onGround && onGroundTimeout > 3) {
		onGround = false;
		rising = true;
		onGroundTimeout = 0;
		obj_boss_1_wings.image_speed = 1;
	}

	if(!onGround && rising && y > 86) {
		risingSpeed -= 0.4;
	}

	if(rising && y <= 86) {
		rising = false;
		risingSpeed = 0;
		additionalY = 0;
		y = 86;
	}

	if(additionalY = 0) {
		lastY = y;
	}

	if(!falling && !place_meeting(x, y + 1, obj_ground_group) && !rising) {
		y = y + additionalY;
		additionalY += 0.1;
	}

	if(additionalY > 1.5) {
		additionalY = 0;
		y = lastY;
	}

	if(!rising && !onGround && !moving) {
		moveTimeout += delta_time / 1000000;
	}

	if(!onGround && moving) {
		fallTimeout += delta_time / 1000000;
		moveSpeedTimeout += delta_time / 1000000;	
	}

	if(!rising && !onGround && !moving && moveTimeout > 1) {
		moving = true;
		moveTimeout = 0;
	}

	if(!moving && instance_exists(obj_player)) {
		if(x < obj_player.x)
			instanceDirection = 1;
	
		if(x > obj_player.x)
			instanceDirection = -1;
	}

	if(moving && moveSpeedTimeout > 1 && instance_exists(obj_player)) {
		moveSpeedTimeout = 0;
	
		if(x < obj_player.x)
			instanceDirection = 1;
	
		if(x > obj_player.x)
			instanceDirection = -1;
		
		var distance = abs(x - obj_player.x);
	
		if(distance < 120) {
			movingSpeed = 3;
		} else {
			movingSpeed = 5;
		}
	}

	if(moving) {
		x += movingSpeed * instanceDirection;
		if(goombaLaunchTimer > 0.45 && currentAnim == "idle" && instance_number(obj_goomba) < 3) {
			currentAnim = "launch";
			animationTimeout = 0;
			goombaLaunchTimer = 0;
			audio_play_sound(snd_flying_goomba_hit, 1, false);
		}
		
		goombaLaunchTimer += delta_time / 1000000;
	}

	if(fallTimeout > 4) {
		fallTimeout = 0;
		falling = true;
		moving = false;
	}
	
	if(currentAnim == "damaged" && animationTimeout > 0.3) {
		currentAnim = "idle";
		animationTimeout = 0;
	}
	
	if(currentAnim == "launch" && animationTimeout > 0.3) {
		currentAnim = "idle";
		animationTimeout = 0;
		audio_play_sound(snd_dry_bones_hit, 1, false);
		var inst = instance_create_layer(x, y, "Objects", obj_goomba);
		inst.currentY = -6;
	}
	
	switch(currentAnim) {
		case "idle": {
			sprite_index = spr_boss_1_idle;
			break;
		}
		
		case "launch": {
			sprite_index = spr_boss_1_launch;
			break;
		}
		
		case "damaged": {
			sprite_index = spr_boss_1_damage;
			break;
		}
	}

	if(falling) {
		fallSpeed += 0.2;
		if(!place_meeting(x, y + round(fallSpeed), obj_ground_group)) {
			y += round(fallSpeed)
		} else {
			while(!place_meeting(x, y + sign(fallSpeed), obj_ground_group)) {
				y += 1;
			}
		
			audio_play_sound(snd_impact_generic, 1, false);
			falling = false;
			onGround = true;
			fallSpeed = 0;
			risingSpeed = 0;
			obj_boss_1_wings.image_speed = 0;
			if(instance_exists(obj_goomba)) {
				with(obj_goomba) {
					currentY = -6;
				}
			}
		}
	}
	
	if(place_meeting(x, y - obj_player.currentY, obj_player) && !place_meeting(x, y + 10, obj_player)) {
		if(onGround) {
			onGroundTimeout = 3;
		}
		
		instanceDirection = -instanceDirection;
		
		audio_stop_sound(snd_flying_goomba_hit);
		audio_play_sound(snd_flying_goomba_hit, 1, false);
		
		obj_player.currentY = -3;
		obj_player.y = y - sprite_height;
		
		goombaLaunchTimer = 0;
		currentAnim = "damaged";
		animationTimeout = 0;
	}
	
	if(place_meeting(x, y + 10, obj_player) && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(3);
	}

	if(x < 80)
		x = 80;
	
	if(x > 560)
		x = 560;

	if(rising)
		y += risingSpeed;
	
	image_xscale = instanceDirection;
} else {
	image_speed = 0;
}