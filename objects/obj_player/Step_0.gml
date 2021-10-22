//Horizontal Movement
if(!hitState && canMove)
	currentX = horizontalSpeed * global.horizontal + platformHorizontalEffector;

//Clamp variables
currentX = clamp(currentX, -xMax, xMax);
currentY = clamp(currentY, -yMax, yMax);

//Step Variables
onGround = place_meeting(x, y + 1, obj_ground_group) || steppingOnPlatform;
isMoving = !place_meeting(x + global.horizontal, y, obj_ground_group) && global.horizontal != 0;

steppingOnPlatform = false;

if(global.horizontal != 0)
	lastHorizontalDirection = global.horizontal;

//Collisions
////Horizontal
if(!place_meeting(x + currentX, y, obj_ground_group) && !hitState && canMove) {
	x += currentX;
} else {
	while(!place_meeting(x + sign(currentX), y, obj_ground_group) && !hitState && canMove){
		x += sign(currentX);
	}
}

if(onGround) {
	blockHit = false;
	enemyBounce = false;
}

currentY += 0.18;

if(place_meeting(x, y + 1, obj_destroyable_platform)) {
	if(instance_exists(obj_platform_breaker)) {
		obj_platform_breaker.active = true;
	}
}

////Vertical
if(!warpState) {
	if(!place_meeting(x, y + round(currentY), obj_ground_group)) {
		y += round(currentY);
	} else {
		while(!place_meeting(x, y + sign(currentY), obj_ground_group)) {
			y += sign(currentY);
		}
		currentY = 0;
	}
}

if(onGround && global.jump && global.vertical >= 0 && !hitState && canMove) {
	currentY = -5;
	audio_play_sound(snd_mario_jump, 1, false);
}

if(onGround && global.jump && global.vertical < 0 && !hitState && canMove) {
	currentY = -5.76;
	audio_play_sound(snd_mario_jump, 1, false);
	audio_play_sound(snd_mario_highjump, 1, false);
}

if(!warpState)
	obj_player_sprite.depth = 100;
else
	obj_player_sprite.depth = 150;

//Hit and invincibility timers
if(hitState)
	hitTimeout += delta_time / 1000000;

if(invincibilityState)
	invincibilityTimeout += delta_time / 1000000;

if(hitState && hitTimeout > 1) {
	hitState = false;
	hitTimeout = 0;
	invincibilityState = true;
}

if(invincibilityState && invincibilityTimeout > 2) {
	invincibilityState = false;
	invincibilityTimeout = 0;
}

if(global.pHealth == 0 && !playerDead) {
	audio_stop_all();
	playerDead = true;
	instance_create_layer(x, y, "Objects", obj_player_dead);
	instance_destroy(obj_player_sprite);
	instance_destroy();
	audio_play_sound(snd_mario_dead, 1, false);
}

if(y > room_height + sprite_height + 64 && !playerDead && canMove) {
	playerDead = true;
	instance_destroy();
	audio_stop_all();
	audio_play_sound(snd_mario_dead, 1, false);
	global.playerDead = true;
}

if(!attacking && !hitState && !playerDead && global.attack) {
	switch(global.playerWeapon) {
		case "hammer": {
			if(global.hearts > 0 && instance_number(obj_hammer_player) < 2) {
				audio_play_sound(snd_weapon_1, 1, false);
				global.hearts--;
				obj_player_sprite.image_index = 0;
				var hammer = instance_create_layer(x + (8 * lastHorizontalDirection), y - 16, "Objects", obj_hammer_player);
				hammer.initial_horizontal = hammer.initial_horizontal * lastHorizontalDirection;
				hammer.hammer_direction = lastHorizontalDirection;
				attacking = true;
			}
			break;
		}
		
		case "fire_flower": {
			if(global.hearts > 0 && instance_number(obj_fireball) < 2) {
				audio_play_sound(snd_weapon_1, 1, false);
				global.hearts--;
				obj_player_sprite.image_index = 0;
				var fireball = instance_create_layer(x + (8 * lastHorizontalDirection), y - 16, "Objects", obj_fireball);
				fireball.fire_direction = fireball.fire_direction * lastHorizontalDirection;
				fireball.fire_direction = lastHorizontalDirection;
				attacking = true;
			}
			break;
		}
		
		case "cross": {
			if(global.hearts > 1 && instance_number(obj_cross) < 1) {
				audio_play_sound(snd_cross_throw, 1, false);
				global.hearts -= 2;
				obj_player_sprite.image_index = 0;
				var cross = instance_create_layer(x + (8 * lastHorizontalDirection), y - 16, "Objects", obj_cross);
				cross.cross_direction = cross.cross_direction * lastHorizontalDirection;
				cross.cross_direction = lastHorizontalDirection;
				attacking = true;
			}
			break;
		}
	}
}

if(attacking && obj_player_sprite.sprite_index == spr_mario_attack && obj_player_sprite.image_index > 3) {
	attacking = false;
}

if(warpState) {
	switch(warpDirection) {
		case "up": {
			if(y > warpYLimit)
				y -= 0.7;
			else {
				if(global.screenToWarp != noone) {
					obj_stage_manager.stage_fadeout = true;
					
					if(global.smoothTransitions && obj_stage_manager.stage_fadeout_offset >= camera_get_view_width(view_camera[0]) + 64 && obj_stage_manager.stage_fadeout && obj_stage_manager.stage_fadeout_timer > 1) {
						room_goto(global.screenToWarp);
					} else if(!global.smoothTransitions) {
						room_goto(global.screenToWarp);
					}
					
				} else {
					canMove = true;
					warpState = false;
					currentY = 0;
					global.initialWarping = false;
				}
			}
			break;
		}
		
		case "down": {
			if(y < warpYLimit)
				y += 0.7;
			else {
				if(global.screenToWarp != noone) {
					obj_stage_manager.stage_fadeout = true;
					
					if(global.smoothTransitions && obj_stage_manager.stage_fadeout_offset >= camera_get_view_width(view_camera[0]) + 64 && obj_stage_manager.stage_fadeout && obj_stage_manager.stage_fadeout_timer > 1) {
						room_goto(global.screenToWarp);
					} else if(!global.smoothTransitions) {
						room_goto(global.screenToWarp);
					}
					
				} else {
					canMove = true;
					warpState = false;
					currentY = 0;
					global.initialWarping = false;
				}
			}
			break;
		}
	}
}

show_debug_message(global.initialWarpDirection);

//Reset Platform Effectors
platformHorizontalEffector = 0;

if(global.oneHit && global.pHealth > 1)
	global.pHealth = 1;