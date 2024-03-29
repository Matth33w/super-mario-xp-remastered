if(appearing && y > initialY - sprite_height && !global.playerDead){
	y -= 0.35;
} else {
	appearing = false;
}

onGround = place_meeting(x, y + 1, obj_ground_group);

if(place_meeting(x, y, obj_player) && !appearing) {
	switch(mushroomType) {
		case "normal": {
			audio_play_sound(snd_mushroom_collect, 1, false);
			global.pHealth += 4;
			instance_destroy();
			break;
		}
		
		case "poisoned": {
			switch(global.character) {
				case "mario": {
					audio_play_sound(snd_poison_mushroom, 1, false);
					break;
				}
				
				case "luigi": {
					audio_play_sound(snd_luigi_poison_mushroom, 1, false);
					break;
				}
			}
			global.pHealth -= 4;
			obj_player.hitState = true;
			instance_destroy();
			break;
		}
		
		case "life": {
			audio_play_sound(snd_life_up, 1, false);
			global.playerLives++;
			instance_create_layer(x, y, "Objects", obj_1up_indicator);
			instance_destroy();
			break;
		}
	}
}

if(!appearing && !global.playerDead) {
	x += round(entitySpeed * entityDirection);
}

if(!appearing && place_meeting(x, y + 1, obj_ground_group)){
	var brick = instance_place(x, y + 1, obj_block_hit_detector);
	var block = instance_place(x, y + 1, obj_block_hit_detector);
	
	if(instance_exists(obj_player)) {
		if(brick != noone && entityCurrentY == 0 && onGround) {
			entityCurrentY = -3;
		
			if(x < brick.x && entityDirection == 1) {
				entityDirection = -1;
			} else if (x >= brick.x && entityDirection == -1) {
				entityDirection = 1;
			}
		} else if(block != noone && entityCurrentY == 0 && onGround) {
			entityCurrentY = -3;
		
			if(x < block.x && entityDirection == 1) {
				entityDirection = -1;
			} else if (x >= block.x && entityDirection == -1) {
				entityDirection = 1;
			}
		}
	}
}

switch(mushroomType) {
	case "normal": {
		sprite_index = spr_mushroom;
		break;
	}
	
	case "poisoned": {
		sprite_index = spr_poison_mushroom;
		break;
	}
	
	case "life": {
		sprite_index = spr_life_mushroom;
		break;
	}
}

entityCurrentY += 0.2;

if(!place_meeting(x, y + round(entityCurrentY), obj_ground_group) && !appearing && !global.playerDead) {
	y += round(entityCurrentY);
} else {
	while(!place_meeting(x, y + sign(entityCurrentY), obj_ground_group) && !global.playerDead) {
		y += sign(entityCurrentY);
	}
	
	entityCurrentY = 0;
}

if(place_meeting(x + (entitySpeed * entityDirection), y, obj_ground_group)) {
	entityDirection = -entityDirection;
}

if(y > room_height + 32) {
	instance_destroy();
}