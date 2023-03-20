if(image_index > 4) {
	instance_destroy();
}

switch(emitter) {
	case "mario": {
		sprite_index = spr_fireball_explosion;
		break;
	}
	
	case "luigi": {
		sprite_index = spr_luigi_fireball_explosion;
		break;
	}
}
