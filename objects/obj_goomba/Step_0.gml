onCamera =  (x - sprite_width) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && 
			(x + sprite_width) > camera_get_view_x(view_camera[0]); /*&&
			(y - sprite_height) < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) &&
			(y + sprite_height > camera_get_view_y(view_camera[0]));*/

if(entityDirection == -1 && 
   onCamera &&
   !dead &&
   !defeated &&
   !global.playerDead
){
	currentX = -entitySpeed;
	x += currentX;
} else if(
   entityDirection == 1 && 
   onCamera &&
   !dead &&
   !defeated &&
   !global.playerDead
) {
	currentX = entitySpeed;
	x += currentX;
}

if(!onCamera && instance_exists(obj_player)) {
	if(x < obj_player.x) {
		entityDirection = 1;
	} else if (x > obj_player.x) {
		entityDirection = -1;
	}
}

if(place_meeting(x, y - 1, obj_player) && !dead && !defeated && !global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
	dead = true;
	audio_play_sound(snd_goomba_death, 1, false);
	sprite_index = spr_goomba_dead;
	obj_player.currentY = -1.5;
	obj_player.enemyBounce += 1;
	check_bounce();
} else if(place_meeting(x, y - 1, obj_player) && !dead && !defeated && global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
	dead = true;
	audio_play_sound(snd_goomba_death, 1, false);
	sprite_index = spr_goomba_dead;
	obj_player.currentY = -5;
	obj_player.enemyBounce += 1;
	check_bounce();
} else if(place_meeting(x, y, obj_player) && !dead && !defeated && !obj_player.hitState && !obj_player.invincibilityState) {
	mario_damage(3);
}

if(dead) {
	deadTimeout += delta_time / 1000000;
	if(deadTimeout > 0.5)
		instance_destroy();
}

if(defeated) {
	y += defeatedYSpeed;
	defeatedYSpeed += 0.3;
}

if(!defeated && !dead) {
	var hammerTouched = instance_place(x, y, obj_hammer_player);
	var fireTouched = instance_place(x, y, obj_fireball);
	var crossTouched = instance_place(x, y, obj_cross);
	
	var blockTouched = instance_place(x, y + 1, obj_item_block);
	var brickTouched = instance_place(x, y + 1, obj_brick);
	
	var koopa = instance_place(x, y + 1, obj_koopa);
	
	if(hammerTouched) {
		defeated = true;
		hammerTouched.initial_vertical = -2.5;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_goomba_defeated;
	}
	
	if(fireTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_goomba_defeated;
		instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
		instance_destroy(fireTouched);
	}
	
	if(crossTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		sprite_index = spr_goomba_defeated;
	}
	
	if(blockTouched) {
		if(blockTouched.sprite_index == spr_item_block_destroyed && blockTouched.image_speed != 0) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_goomba_defeated;
		}
	}
	
	if(brickTouched) {
		if(brickTouched.sprite_index == spr_brick_destroyed && brickTouched.image_speed != 0) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_goomba_defeated;
		}
	}
	
	if(koopa) {	
		if(koopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			sprite_index = spr_goomba_defeated;
		}
	}
}

if(!defeated) {
	if(place_meeting(x + currentX, y, obj_ground_group)) {
		entityDirection = -entityDirection;
	} else {
		instance = instance_place(x + currentX, y, obj_enemy_group);
		if(instance != noone && !instance.dead && !instance.defeated) {
			entityDirection = -entityDirection;
		
			while(!instance.onCamera && place_meeting(x, y, obj_enemy_group)){
				instance.x -= 1;
			}
		}
	}
}
if(onCamera && !global.playerDead && !defeated) {
	currentY += 0.3;
	
	if(!place_meeting(x, y + currentY, obj_ground_group)) {
		y += currentY;
	} else {
		while(!place_meeting(x, y + sign(currentY), obj_ground_group)) {
			y += sign(currentY);
		}
	
		currentY = 0;
	}
}

if(global.playerDead) {
	image_speed = 0;
}