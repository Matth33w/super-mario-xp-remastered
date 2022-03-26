canMove = false;
dead = false;
ySpeed = 0;

sprite_index = noone;

if(instance_exists(obj_player)) {
	if(obj_player.x > x) {
		image_xscale = 1;
	} else if(obj_player.x < x) {
		image_xscale = -1;
	}
}

switch(skin) {
	case "goomba": {
		sprite_index = spr_ghost_goomba;
		break;
	}
			
	default: {
		sprite_index = spr_boo_idle;
		break;
	}
}