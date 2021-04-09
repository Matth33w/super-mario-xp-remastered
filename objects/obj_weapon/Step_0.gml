switch(weapon_type) {
	case "hammer": {
		sprite_index = spr_hammer_idle;
		break;
	}
	
	case "cross": {
		sprite_index = spr_cross_idle;
		break;
	}
	
	default: {
		sprite_index = spr_fire_flower_idle;
		break;
	}	
}

if(place_meeting(x, y, obj_player)) {
	
	if(weapon_type != global.playerWeapon) {
		audio_play_sound(snd_item_collect, 1, false);
	} else {
		audio_play_sound(snd_heart, 1, false);
		global.hearts += 10;
	}
	
	switch(weapon_type) {
		case "hammer": {
			global.playerWeapon = "hammer";
			break;
		}
	
		case "cross": {
			global.playerWeapon = "cross";
			break;
		}
	
		default: {
			global.playerWeapon = "fire_flower";
			break;
		}
	}
	
	instance_destroy();
}