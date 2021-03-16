if(appearing && y > initialY - sprite_height){
	y -= 0.35;
} else {
	appearing = false;
}

if(place_meeting(x, y, obj_player)) {
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
	}
}

if(!appearing) {
	x += round(entitySpeed * entityDirection);
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
}

entityCurrentY += 0.2;

if(!place_meeting(x, y + entityCurrentY, obj_ground_group) && !appearing) {
	y += entityCurrentY;
} else {
	while(!place_meeting(x, y + sign(entityCurrentY), obj_ground_group)) {
		y += sign(entityCurrentY);
	}
	
	entityCurrentY = 0;
}

if(place_meeting(x + (entitySpeed * entityDirection), y, obj_ground_group)) {
	entityDirection = -entityDirection;
}