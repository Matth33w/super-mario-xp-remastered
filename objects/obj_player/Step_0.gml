//Horizontal Movement
if(!hitState && canMove && !itemCrash)
	currentX = horizontalSpeed * global.horizontal + platformHorizontalEffector;
else if (itemCrash) {
	currentX = platformHorizontalEffector;
}

//Clamp variables
currentX = clamp(currentX, -xMax, xMax);
currentY = clamp(currentY, -yMax, yMax);

//Step Variables
onGround = place_meeting(x, y + 1, obj_ground_group) || steppingOnPlatform;
isMoving = !place_meeting(x + global.horizontal, y, obj_ground_group) && global.horizontal != 0;

steppingOnPlatform = false;

if(global.horizontal != 0 && !itemCrash)
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

if(itemCrash && obj_player_sprite.sprite_index == spr_mario_special_1) {
	if(obj_player_sprite.image_index > 34) {
		itemCrash = false;
		invincibilityState = true;
		invincibilityTimeout = 0;
		itemCrashTimeout = 0;
		itemCrashCrossSFX = false;
	}
	
	switch(global.playerWeapon) {
		case "hammer": {
			if(itemCrashThrow > 0.07) {
				audio_play_sound(snd_weapon_1, 1, false);
				var hammer = instance_create_layer(x + (8 * lastHorizontalDirection), y - 16, "Objects", obj_hammer_player);
				hammer.initial_horizontal = random_range(0.6,3) * lastHorizontalDirection;
				hammer.hammer_direction = lastHorizontalDirection;
				itemCrashThrow = 0;
			}
			break;
		}
		
		case "fire_flower": {
			if(itemCrashThrow > 0.07) {
				audio_play_sound(snd_weapon_1, 1, false);
				var fireball = instance_create_layer(x + (8 * lastHorizontalDirection), y - 16, "Objects", obj_fireball);
				fireball.fire_direction = fireball.fire_direction * lastHorizontalDirection;
				fireball.fire_direction = lastHorizontalDirection;
				fireball.currentY = random_range(-3, 0);
				itemCrashThrow = 0;
			}
			break;
		}
	}
}

if(itemCrash && obj_player_sprite.sprite_index == spr_mario_special_2) {
	if(itemCrashTimeout > 3) {
		itemCrash = false;
		invincibilityState = true;
		invincibilityTimeout = 0;
		itemCrashTimeout = 0;
		itemCrashCrossSFX = false;
	}
	
	if(!itemCrashCrossSFX && itemCrashTimeout > 1) {
		itemCrashCrossSFX = true;
		audio_play_sound(snd_cross_loop, 1, false);
	}
	
	if(itemCrashThrow > 0.06) {
		var cross = instance_create_layer(irandom_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), "Objects", obj_cross);
		cross.specialXSpeed = random_range(-2, 2);
		cross.specialCross = true;
		itemCrashThrow = 0;
	}
}

if(itemCrash) {
	itemCrashTimeout += delta_time / 1000000;
	itemCrashThrow += delta_time / 1000000;
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

if(onGround && global.jump && global.vertical >= 0 && !hitState && canMove && !itemCrash) {
	image_yscale = 1;
	currentY = -5;
	audio_play_sound(snd_mario_jump, 1, false);
}

if(onGround && global.jump && global.vertical < 0 && !hitState && canMove && !itemCrash) {
	image_yscale = 1;
	currentY = -5.76;
	audio_play_sound(snd_mario_jump, 1, false);
	audio_play_sound(snd_mario_highjump, 1, false);
}

if(onGround && !global.jump && global.vertical > 0 && !isMoving && !hitState) {
	image_yscale = 0.5;
} else {
	image_yscale = 1;
}

if(place_meeting(x, y, obj_ground_group) && !warpState) 
	while(place_meeting(x, y, obj_ground_group))
		x += 1 * lastHorizontalDirection;

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
	audio_play_sound(global.bgm_death_jingle, 1, false);
	global.playerDead = true;
}

if(!attacking && !hitState && !playerDead && global.attack && !obj_stage_manager.stage_fadeout && !warpState && !itemCrash) {
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

if(instance_exists(obj_player_sprite)) {
	if(attacking && obj_player_sprite.sprite_index == spr_mario_attack && obj_player_sprite.image_index > 3) {
		attacking = false;
	}
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

if(!itemCrash && global.special && !hitState && !warpState) {
	obj_player_sprite.image_xscale = lastHorizontalDirection;

	if(global.playerWeapon == "fire_flower" && global.hearts >= 10) {
		itemCrash = true;
		itemCrashThrow = 0;
		itemCrashTimeout = 0;
		invincibilityState = false;
		invincibilityTimeout = 0;
		audio_play_sound(snd_item_crash_1, 1, false);
		audio_play_sound(snd_item_crash_2, 1, false);
		global.hearts -= 10;
	}
	
	if(global.playerWeapon == "hammer" && global.hearts >= 10) {
		itemCrash = true;
		itemCrashThrow = 0;
		itemCrashTimeout = 0;
		invincibilityState = false;
		invincibilityTimeout = 0;
		audio_play_sound(snd_item_crash_1, 1, false);
		audio_play_sound(snd_item_crash_2, 1, false);
		global.hearts -= 10;
	}
	
	if(global.playerWeapon == "cross" && global.hearts >= 20) {
		itemCrash = true;
		itemCrashThrow = 0;
		itemCrashTimeout = 0;
		invincibilityState = false;
		invincibilityTimeout = 0;
		audio_play_sound(snd_mario_grand_cross, 1, false);
		audio_play_sound(snd_item_crash_2, 1, false);
		global.hearts -= 20;
	}
}

if(place_meeting(x, y, obj_cheep_on) && !place_meeting(x, y, obj_cheep_off))
	obj_stage_manager.cheep_cheep_area = true;

if(place_meeting(x, y, obj_cheep_off) && !place_meeting(x, y, obj_cheep_on))
	obj_stage_manager.cheep_cheep_area = false;

show_debug_message(global.initialWarpDirection);

//Reset Platform Effectors
platformHorizontalEffector = 0;

if(global.oneHit && global.pHealth > 1)
	global.pHealth = 1;