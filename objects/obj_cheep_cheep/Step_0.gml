if(!global.playerDead) {
	y += ySpeed;

	ySpeed += dead ? 0.2 : 0.1;

	image_xscale = entity_direction;

	if(!dead) {
		x += xSpeed * entity_direction;
	}

	if(dead)
		image_yscale = -1;

	if(instance_exists(obj_player)) {
		if(!dead && obj_player.currentY > 0 && place_meeting(x, y - (abs(ySpeed) + abs(obj_player.currentY)), obj_player) && !place_meeting(x, y, obj_player)) {
			if(global.jumpHold && !obj_player.onGround)
				obj_player.currentY = -5;
			else if (!global.jumpHold && !obj_player.onGround)
				obj_player.currentY = -1.5;
			dead = true;
			ySpeed = -2;
			yCount = round(abs(ySpeed - obj_player.currentY));
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
			dead = true
			audio_play_sound(snd_enemy_defeat, 1, false);
			ySpeed = -2;
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