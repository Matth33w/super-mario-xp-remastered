onCamera =  (x - sprite_width / 2) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) + 32 && 
			(x + sprite_width / 2) > camera_get_view_x(view_camera[0]) + 32 &&
			(y - sprite_height - 92) < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) &&
			(y + sprite_height + 92 > camera_get_view_y(view_camera[0]));
if(entityDirection == -1 && 
   (onCamera || !inactive_offscreen) &&
   !dead &&
   !defeated &&
   !global.playerDead
){
	currentX = -entitySpeed;
	x += currentX;
} else if(
   entityDirection == 1 && 
   (onCamera || !inactive_offscreen) &&
   !dead &&
   !defeated &&
   !global.playerDead
) {
	currentX = entitySpeed;
	x += currentX;
}

if(defeated && y > room_height + sprite_height) {
	instance_destroy();
}

image_xscale = entityDirection;

if(place_meeting(x, y - 1, obj_player) && !dead && !defeated && !global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
	defeated = true;
	audio_play_sound(snd_enemy_defeat, 1, false);
	sprite_index = spr_lakitu_dead;
	obj_player.currentY = -1.5;
	obj_player.enemyBounce += 1;
	check_bounce();
} else if(place_meeting(x, y - 1, obj_player) && !dead && !defeated && global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
	defeated = true;
	audio_play_sound(snd_enemy_defeat, 1, false);
	sprite_index = spr_lakitu_dead;
	obj_player.currentY = -5;
	obj_player.enemyBounce += 1;
	check_bounce();
} else if(place_meeting(x, y, obj_player) && !dead && !defeated && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
	mario_damage(3);
}

if(dead) {
	deadTimeout += delta_time / 1000000;
		
	if(deadTimeout > 0.5)
		instance_destroy();
}

if(defeated && !global.playerDead) {
	y += defeatedYSpeed;
	defeatedYSpeed += 0.22;
}

if(!defeated && !dead) {
	var hammerTouched = instance_place(x, y, obj_hammer_player);
	var fireTouched = instance_place(x, y, obj_fireball);
	var crossTouched = instance_place(x, y, obj_cross);
	
	var goomba = instance_place(x, y + 6, obj_goomba);
	var koopa = instance_place(x, y + 1, obj_koopa);
	var paratroopa = instance_place(x, y + 1, obj_paratroopa_path);
	
	if(hammerTouched) {
		defeated = true;
		hammerTouched.initial_vertical = -2.5;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_lakitu_dead;
	}
	
	if(fireTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_lakitu_dead;
		var instance = instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
		instance.emitter = fireTouched.emitter;
		instance_destroy(fireTouched);
	}
	
	if(crossTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_lakitu_dead;
	}
	
	if(goomba) {
		if(!goomba.dead && goomba.currentY >= 1) {
			x += 8;
			goomba.x -= 8;
		}
	}
	
	if(koopa) {	
		if(koopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_lakitu_dead;
		}
	}
	
	if(paratroopa) {	
		if(paratroopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_lakitu_dead;
		}
	}
}

if(!defeated) {
	
}

if(!global.playerDead && !defeated) {
	currentY += 0.20;
	
	jumpTimeout += delta_time / 1000000;
	
	if(!hammerThrown && image_index >= 10 && image_index <= 12 && y < 7800) {
		hammerThrown = true;
		audio_play_sound(snd_throw, 1, false);
		instance_create_layer(x, y, "Objects", obj_spiny_falling);
	} else if(hammerThrown && image_index < 2) {
		hammerThrown = false;
	}
}

if(global.playerDead) {
	image_speed = 0;
}