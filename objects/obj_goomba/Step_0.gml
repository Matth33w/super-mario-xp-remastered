onCamera =  (x - sprite_width) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && 
			(x + sprite_width) > camera_get_view_x(view_camera[0]) &&
			(y - sprite_height) < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) &&
			(y + sprite_height > camera_get_view_y(view_camera[0]));

if(entityDirection == -1 && 
   onCamera &&
   !dead &&
   !global.playerDead
){
	currentX = -entitySpeed;
	x += currentX;
} else if(
   entityDirection == 1 && 
   onCamera &&
   !dead &&
   !global.playerDead
) {
	currentX = entitySpeed;
	x += currentX;
}

if(place_meeting(x, y - 1, obj_player) && !dead && !global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
	dead = true;
	audio_play_sound(snd_goomba_death, 1, false);
	sprite_index = spr_goomba_dead;
	obj_player.currentY = -1.5;
} else if(place_meeting(x, y - 1, obj_player) && !dead && global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
	dead = true;
	audio_play_sound(snd_goomba_death, 1, false);
	sprite_index = spr_goomba_dead;
	obj_player.currentY = -5;
} else if(place_meeting(x, y, obj_player) && !dead && !obj_player.hitState && !obj_player.invincibilityState) {
	obj_player.hitState = true;
	global.pHealth -= 3;
	audio_play_sound(snd_mario_damage_1, 1, false);
}

if(dead) {
	deadTimeout += delta_time / 1000000;
	if(deadTimeout > 0.5)
		instance_destroy();
}

if(place_meeting(x + currentX, y, obj_ground_group)) {
	entityDirection = -entityDirection;
} else {
	instance = instance_place(x + currentX, y, obj_goomba);
	if(instance != noone && instance.dead == false) {
		entityDirection = -entityDirection;
		
		while(!instance.onCamera && place_meeting(x, y, obj_goomba)){
			instance.x -= 1;
		}
	}
}

if(onCamera && !global.playerDead) {
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