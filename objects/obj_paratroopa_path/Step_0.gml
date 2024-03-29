onCamera =  (x - sprite_width - 32) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && 
			(x + sprite_width + 32) > camera_get_view_x(view_camera[0]); /*&&
			(y - sprite_height) < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) &&
			(y + sprite_height > camera_get_view_y(view_camera[0]));*/

if(entityDirection == -1 && 
   !dead &&
   !defeated &&
   !global.playerDead &&
   onCamera
){
	switch(type) {
		case "green": {
			if(increase) {
				currentX -= 0.025;
			} else {
				currentX += 0.025;
			}
			
			if(increase && currentX < -1.8) {
				increase = false;
			}
			
			if(!increase && currentX >= 0) {
				currentX = 0;
				increase = true;
				entityDirection = 1;
			}
			x += currentX;
			break;
		}
		
		case "red": {
			if(increase) {
				currentY += 0.015;
			} else {
				currentY -= 0.015;
			}
			
			if(increase && currentY > 1.2) {
				increase = false;
			}
			
			if(!increase && currentY <= 0) {
				currentY = 0;
				increase = true;
				entityDirection = 1;
			}
			y += currentY;
			break;
		}
	}
} else if(
   entityDirection == 1 && 
   !dead &&
   !defeated &&
   !global.playerDead &&
   onCamera
) {
	switch(type) {
		case "green": {
			if(increase) {
				currentX += 0.025;
			} else {
				currentX -= 0.025;
			}
			
			if(increase && currentX > 1.8) {
				increase = false;
			}
			
			if(!increase && currentX <= 0) {
				currentX = 0;
				increase = true;
				entityDirection = -1;
			}
			x += currentX;
			break;
		}
		
		case "red": {
			if(increase) {
				currentY -= 0.015;
			} else {
				currentY += 0.015;
			}
			
			if(increase && currentY < -1.2) {
				increase = false;
			}
			
			if(!increase && currentY >= 0) {
				currentY = 0;
				increase = true;
				entityDirection = -1;
			}
			y += currentY;
			break;
		}
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
		while(obj_player.y < y - sprite_height && !obj_player.onGround) {
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
		while(obj_player.y < y - sprite_height && !obj_player.onGround) {
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
	
	var blockTouched = instance_place(x, y + 1, obj_block_hit_detector);
	var brickTouched = instance_place(x, y + 1, obj_block_hit_detector);
	var koopa = instance_place(x, y + 1, obj_koopa);
	
	var paratroopa = instance_place(x, y + 1, obj_paratroopa_path);
	
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
		var instance = instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
		instance.emitter = fireTouched.emitter;
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
		dead = true;
		audio_stop_sound(snd_enemy_defeat);
		audio_play_sound(snd_enemy_defeat, 1, false);
		if(type == "green")
			sprite_index = spr_shell_green;
		else if(type == "red")
			sprite_index = spr_shell_red;
		currentY = -2;
	}
	
	if(brickTouched) {
		dead = true;
		audio_stop_sound(snd_enemy_defeat);
		audio_play_sound(snd_enemy_defeat, 1, false);
		if(type == "green")
			sprite_index = spr_shell_green;
		else if(type == "red")
			sprite_index = spr_shell_red;
		currentY = -2;
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
	
	if(paratroopa) {	
		if(paratroopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			if(type == "green")
				sprite_index = spr_koopa_defeated;
			else if(type == "red")
				sprite_index = spr_redkoopa_defeated;
		}
	}
}

if(onCamera && !global.playerDead && !defeated) {
	switch(dead) {
		case true: {
			currentY += 0.11;
			break;
		}
	}
	
	if(dead) {
		if(!place_meeting(x, y + round(currentY), obj_ground_group)) {
			y += round(currentY);
		} else {
			while(!place_meeting(x, y + sign(currentY), obj_ground_group)) {
				y += sign(currentY);
			}
	
			currentY = 0;
		}
	}
}

if(global.playerDead) {
	image_speed = 0;
}

if(!dead) {
	if(instance_exists(obj_player)) {
		switch(type) {
			case "green": {
				image_xscale = entityDirection;
				break;
			}
			
			case "red": {
				if(obj_player.x < x)
					image_xscale = -1;
				if(obj_player.x > x)
					image_xscale = 1;	
				break;
			}
		}
	}
} else {
	image_xscale = 1;
}