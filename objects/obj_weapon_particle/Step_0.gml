switch(weapon_type){
	case "hammer": {
		sprite_index = spr_hammer_particle;
		break;
	}
	
	case "fire": {
		sprite_index = spr_fire_particle;
		y -= 1;
		break;
	}
	
	case "cross": {
		sprite_index = spr_cross_particle;
		break;
	}
}

if(image_index > 4) {
	instance_destroy();
}