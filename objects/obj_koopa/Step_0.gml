onCamera =  (x - sprite_width - 32) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && 
			(x + sprite_width + 32) > camera_get_view_x(view_camera[0]); /*&&
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

if(dead && !defeated && place_meeting(x, y, obj_ground_group)) {
	while(place_meeting(x, y, obj_ground_group)) {
		y -= 1;
	}
}

if(shellMoving && !defeated && !global.playerDead) {
	if(!place_meeting(x + round(shellDirection * 3), y, obj_ground_group)) {
		x += round(shellDirection * 3);
	} else {
		while(!place_meeting(x + sign(shellDirection), y, obj_ground_group)) {
			x += sign(shellDirection);
		}
		
		shellDirection = -shellDirection;
		currentY = 0;
		audio_play_sound(snd_shell_hit_2, 1, false);
	}
	
	if(!onCamera)
		instance_destroy();
}

if(defeated && !global.playerDead) {
	y += defeatedYSpeed;
	defeatedYSpeed += 0.3;
}

if(type == "green" && paratroopa && place_meeting(x, y + 1, obj_ground_group) && !dead) {
	currentY = -4;
}

if(instance_exists(obj_player)) {
	if(!defeated && dead && !shellMoving && place_meeting(x + abs(obj_player.currentX) + 3, y, obj_player)) {
		obj_player.enemyBounce += 1;
		check_bounce();
		obj_player.currentY = -1.5;
	
		shellMoving = true;
		shellDirection = -1;
		audio_play_sound(snd_shell_hit, 1, false);
	}

	if(!defeated && dead && !shellMoving && place_meeting(x + (-abs(obj_player.currentX) - 3), y, obj_player)) {
		obj_player.enemyBounce += 1;
		check_bounce();
		obj_player.currentY = -1.5;
	
		shellMoving = true;
		shellDirection = 1;
		audio_play_sound(snd_shell_hit, 1, false);
	}
	
	if(place_meeting(x, y - obj_player.currentY, obj_player) && !dead && !defeated && !global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
		dead = true;
		audio_play_sound(snd_goomba_death, 1, false);
		if(type == "green")
			sprite_index = spr_shell_green;
		else if(type == "red")
			sprite_index = spr_shell_red;
		obj_player.currentY = -1.5;
		obj_player.enemyBounce += 1;
		currentY = 0;
		check_bounce();
	} else if(place_meeting(x, y - obj_player.currentY, obj_player) && !dead && !defeated && global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
		dead = true;
		audio_play_sound(snd_goomba_death, 1, false);
		if(type == "green")
			sprite_index = spr_shell_green;
		else if(type == "red")
			sprite_index = spr_shell_red;
		obj_player.currentY = -5;
		obj_player.enemyBounce += 1;
		currentY = 0;
		check_bounce();
	} else if(place_meeting(x, y, obj_player) && !dead && !defeated && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(3);
	}

	if(place_meeting(x, y - obj_player.currentY, obj_player) && dead && !defeated && !global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
		audio_play_sound(snd_shell_hit, 1, false);
		obj_player.enemyBounce += 1;
		check_bounce();
		while(obj_player.y < y - sprite_height && !obj_player.place_meeting(x, y + 1, obj_ground_group)) {
			obj_player.y += 1;
		}
		obj_player.currentY = -1.5;
	
		if(!shellMoving)
			shellMoving = true;
		
		shellDirection = sign(x - obj_player.x);
		if(shellDirection == 0)
			shellDirection = 1;
		
	} else if(place_meeting(x, y - obj_player.currentY, obj_player) && dead && !defeated && global.jumpHold && !obj_player.onGround && obj_player.y < (y - sprite_height / 2) && obj_player.currentY > 0) {
		audio_play_sound(snd_shell_hit, 1, false);
		obj_player.enemyBounce += 1;
		check_bounce();
		while(obj_player.y < y - sprite_height && !obj_player.place_meeting(x, y + 1, obj_ground_group)) {
			obj_player.y += 1;
		}
		obj_player.currentY = -5;
	
		if(!shellMoving)
			shellMoving = true;
		
		shellDirection = sign(x - obj_player.x);
		if(shellDirection == 0)
			shellDirection = 1;
	
	} else if(place_meeting(x, y, obj_player) && dead && shellMoving && !defeated && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(3);
	}
}

if(!defeated) {
	var hammerTouched = instance_place(x, y, obj_hammer_player);
	var fireTouched = instance_place(x, y, obj_fireball);
	var crossTouched = instance_place(x, y, obj_cross);
	
	var blockTouched = instance_place(x, y + 1, obj_item_block);
	var brickTouched = instance_place(x, y + 1, obj_brick);
	var koopa = instance_place(x, y + 1, obj_koopa);
	
	var paratroopaPath = instance_place(x, y + 1, obj_paratroopa_path);
	
	if(hammerTouched) {
		defeated = true;
		hammerTouched.initial_vertical = -2.5;
		audio_play_sound(snd_enemy_defeat, 1, false);
		if(type == "green")
			sprite_index = spr_koopa_defeated;
		else if(type == "red")
			sprite_index = spr_redkoopa_defeated;
			
	}
	
	if(fireTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		if(type == "green")
			sprite_index = spr_koopa_defeated;
		else if(type == "red")
			sprite_index = spr_redkoopa_defeated;
		instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
		instance_destroy(fireTouched);
	}
	
	if(crossTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		if(type == "green")
			sprite_index = spr_koopa_defeated;
		else if(type == "red")
			sprite_index = spr_redkoopa_defeated;
	}
	
	if(blockTouched) {
		if(blockTouched.sprite_index == spr_item_block_destroyed && blockTouched.image_speed != 0) {
			dead = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			if(type == "green")
				sprite_index = spr_shell_green;
			else if(type == "red")
				sprite_index = spr_shell_red;
			currentY = -2;
		}
	}
	
	if(brickTouched) {
		if(brickTouched.sprite_index == spr_brick_destroyed && brickTouched.image_speed != 0) {
			dead = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			if(type == "green")
				sprite_index = spr_shell_green;
			else if(type == "red")
				sprite_index = spr_shell_red;
			currentY = -2;
		}
	}
	
	if(koopa) {	
		if(koopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			if(type == "green")
				sprite_index = spr_koopa_defeated;
			else if(type == "red")
				sprite_index = spr_redkoopa_defeated;
		}
	}
	
	if(paratroopaPath) {	
		if(paratroopaPath.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			if(type == "green")
				sprite_index = spr_koopa_defeated;
			else if(type == "red")
				sprite_index = spr_redkoopa_defeated;
		}
	}
}

if(!defeated) {
	if(place_meeting(x + round(currentX), y, obj_ground_group)) {
		entityDirection = -entityDirection;
	} else {
		instance = instance_place(x + round(currentX), y, obj_enemy_group);
		if(instance != noone && !instance.dead && !instance.defeated) {
			entityDirection = -entityDirection;
		
			while(!instance.onCamera && place_meeting(x, y, obj_enemy_group)){
				instance.x -= 1;
			}
		}
	}
	
	if(type == "red") {
		if(!place_meeting(x + (entityDirection * 16), y + 1, obj_ground_group)) {
			entityDirection = -entityDirection;
		}
	}
}
if(onCamera && !global.playerDead && !defeated) {
	switch(dead) {
		case true: {
			currentY += 0.11;
			break;
		}
		
		default: {
			if(paratroopa)
				currentY += 0.2;
			else
				currentY += 0.3;
			break;
		}
	}
	
	if(!place_meeting(x, y + round(currentY), obj_ground_group)) {
		y += round(currentY);
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

if(!dead) {
	image_xscale = entityDirection;
} else {
	image_xscale = 1;
}