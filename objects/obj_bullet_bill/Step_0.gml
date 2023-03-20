if(!global.playerDead) {
	onCamera =  (x - sprite_width - 32) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && 
			(x + sprite_width + 32) > camera_get_view_x(view_camera[0]) &&
			(y - sprite_height) < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) &&
			(y + sprite_height > camera_get_view_y(view_camera[0]));

	y += ySpeed;
	
	if(dead) {
		ySpeed += 0.2;
	}

	image_xscale = entity_direction;

	if(!dead) {
		x += xSpeed * entity_direction;
	}

	if(!onCamera) {
		instance_destroy();
	}

	if(initialOrder)
		depth = 200;
	else
		depth = -10;

	if(initialOrder && !place_meeting(x, y, obj_thrower)) {
		initialOrder = false;
	}

	if(dead)
		image_yscale = -1;

	if(instance_exists(obj_player)) {
		if(!obj_player.onGround && !dead && !place_meeting(x, y - obj_player.currentY, obj_ground_group) && !place_meeting(x, y, obj_thrower) && obj_player.currentY > 0 && obj_player.currentY > 0 && place_meeting(x, y - obj_player.currentY, obj_player) && !place_meeting(x, y, obj_player)) {
		
			if(global.jumpHold && !obj_player.onGround)
				obj_player.currentY = -5;
		
			if (!global.jumpHold && !obj_player.onGround)
				obj_player.currentY = -1.5;
			
			dead = true;
			yCount = round(abs(ySpeed - obj_player.currentY));
			ySpeed = -2;
			obj_player.enemyBounce += 1;
			check_bounce();
			audio_play_sound(snd_enemy_defeat, 1, false);
		}
	
		if(place_meeting(x, y, obj_player) && !dead && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
			mario_damage(2);
		}
	
		var hammerTouched = instance_place(x, y, obj_hammer_player);
		var fireTouched = instance_place(x, y, obj_fireball);
		var crossTouched = instance_place(x, y, obj_cross);
	
		var koopa = instance_place(x, y + 1, obj_koopa);
	
		var paratroopa = instance_place(x, y + 1, obj_paratroopa_path);
	
		if(hammerTouched && !dead) {
			hammerTouched.initial_vertical = -2.5;
			audio_play_sound(snd_enemy_defeat, 1, false);
			dead = true;
			ySpeed = -2;
		}
	
		if(fireTouched && !dead) {
			audio_play_sound(snd_fireball_impact, 1, false);
			var instance = instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
			instance.emitter = fireTouched.emitter;
			instance_destroy(fireTouched);
		}
	
		if(crossTouched && !dead) {
			dead = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			ySpeed = -2;
		}
	
		if(koopa && !dead) {	
			if(koopa.shellMoving) {
				dead = true;
				ySpeed = -2;
				audio_play_sound(snd_enemy_defeat, 1, false);
			}
		}
	
		if(paratroopa && !dead) {	
			if(paratroopa.shellMoving) {
				dead = true;
				ySpeed = -2;
				audio_play_sound(snd_enemy_defeat, 1, false);
			}
		}
	}
} else {
	image_speed = 0;
}