if(place_meeting(x, y, obj_player) && !dead && !defeated && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
	mario_damage(3);
}

if(dead) {
	deadTimeout += delta_time / 1000000;
		
	if(deadTimeout > 0.5)
		instance_destroy();
}

if(defeated && !global.playerDead) {
	y += defeatedYSpeed;
	defeatedYSpeed += 0.3;
}

if(!defeated && !dead) {
	var hammerTouched = instance_place(x, y, obj_hammer_player);
	var fireTouched = instance_place(x, y, obj_fireball);
	var crossTouched = instance_place(x, y, obj_cross);
	
	var koopa = instance_place(x, y + 1, obj_koopa);
	var paratroopa = instance_place(x, y + 1, obj_paratroopa_path);
	
	if(hammerTouched) {
		defeated = true;
		hammerTouched.initial_vertical = -2.5;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_spiny_defeated;
	}
	
	if(fireTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_spiny_defeated;
		var instance = instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
		instance.emitter = fireTouched.emitter;
		instance_destroy(fireTouched);
	}
	
	if(crossTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_spiny_defeated;
	}
	
	if(koopa) {	
		if(koopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_spiny_defeated;
		}
	}
	
	if(paratroopa) {	
		if(paratroopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_spiny_defeated;
		}
	}
}

if(!global.playerDead && !defeated) {
	currentY += 0.17;
	
	if(!place_meeting(x, y + currentY, obj_ground_group)) {
		y += currentY;
	} else {
		while(!place_meeting(x, y + sign(currentY), obj_ground_group)) {
			y += sign(currentY);
		}
		
		var inst = instance_create_layer(x, y + 8, "Objects", obj_spiny);
		if(instance_exists(obj_player)) {
			inst.entityDirection = inst.x > obj_player.x ? -1 : 1;
		} else {
			inst.entityDirection = 1;
		}
		audio_play_sound(snd_impact, 1, false);
		instance_destroy();
	}
}

if(global.playerDead) {
	image_speed = 0;
}

if(y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 12 ||
	y < camera_get_view_y(view_camera[0]) - 16) {
	instance_destroy();
}