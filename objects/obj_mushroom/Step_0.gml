if(appearing && y > initialY - sprite_height && !global.playerDead){
	y -= 0.35;
} else {
	appearing = false;
}

if(place_meeting(x, y, obj_player) && !appearing) {
	switch(mushroomType) {
		case "normal": {
			audio_play_sound(snd_mushroom_collect, 1, false);
			global.pHealth += 4;
			instance_destroy();
			break;
		}
		
		case "poisoned": {
			audio_play_sound(snd_poison_mushroom, 1, false);
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
	var brick = instance_place(x, y + 1, obj_brick);
	var block = instance_place(x, y + 1, obj_item_block);
	var mario = instance_place(x, y + 18, obj_player);
	
	if(brick != noone && brick.destroyed && brick.sprite_index == spr_brick_destroyed && obj_player.blockHit && entityCurrentY == 0 && mario != noone && (x < mario.x + 8 && x > mario.x - 8)) {
		entityCurrentY = -3;
		
		if(x < brick.x && entityDirection == 1) {
			entityDirection = -1;
		} else if (x > brick.x && entityDirection == -1) {
			entityDirection = 1;
		}
	} else if(block != noone && block.hit && block.sprite_index == spr_item_block_destroyed && obj_player.blockHit && entityCurrentY == 0 && mario != noone && (x < mario.x + 8 && x > mario.x - 8)) {
		entityCurrentY = -3;
		
		if(x < block.x && entityDirection == 1) {
			entityDirection = -1;
		} else if (x > block.x && entityDirection == -1) {
			entityDirection = 1;
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