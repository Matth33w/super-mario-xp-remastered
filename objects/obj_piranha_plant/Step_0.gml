switch(piranha_type) {
	case "green": {
		sprite_index = spr_piranha_plant_green;
		break;
	}
			
	case "red": {
		sprite_index = spr_piranha_plant_red;
		break;
	}
}

if(reverse)
	image_yscale = -1;

onScreen = x > camera_get_view_x(view_camera[0]) - 30 && 
		   x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 &&
		   y > camera_get_view_y(view_camera[0]) - 30 && 
		   y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30;

if(onScreen && !global.playerDead && !dead) {
	if(y > initialYPosition) {
		y = initialYPosition;
	} else if(y < maxYPosition) {
		y = maxYPosition;
	}

	if(piranhaDirection == 1 && y < initialYPosition && abs(y - initialYPosition) > piranhaSpeed) {
		y += piranhaSpeed;
	} else if(piranhaDirection == 1 && y < initialYPosition && abs(y - initialYPosition) <= piranhaSpeed) {
		y = initialYPosition;
	}
	
	if (piranhaDirection == -1 && y > maxYPosition && abs(y - maxYPosition) > piranhaSpeed) {
		y -= piranhaSpeed;
	} else if (piranhaDirection == -1 && y > maxYPosition && abs(y - maxYPosition) <= piranhaSpeed) {
		y = maxYPosition;
	}

	piranhaTimeout -= delta_time / 1000000;
	
	if(piranhaTimeout <= 0) {
		switch(piranha_type) {
			case "green": {
				piranhaTimeout = 3;
				break;
			}
			
			case "red": {
				piranhaTimeout = 1.25;
				break;
			}
		}
		piranhaDirection = -piranhaDirection;
	}
}

if(!dead) {
	var hammerTouched = instance_place(x, y, obj_hammer_player);
	var fireTouched = instance_place(x, y, obj_fireball);
	var crossTouched = instance_place(x, y, obj_cross);
	var koopa = instance_place(x, y + 1, obj_koopa);
	
	var dir = reverse ? -1 : 1;
	
	if(hammerTouched) {
		dead = true;
		hammerTouched.initial_vertical = -2.5;
		audio_play_sound(snd_enemy_defeat, 1, false);
		instance_create_layer(x, y - 8 * dir, "Objects", obj_piranha_plant_defeated);
		instance_destroy();
	}
	
	if(fireTouched) {
		dead = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		instance_create_layer(fireTouched.x, fireTouched.y, "Objects", obj_fireball_explosion);
		instance_destroy(fireTouched);
		instance_create_layer(x, y - 8 * dir, "Objects", obj_piranha_plant_defeated);
		instance_destroy();
	}
	
	if(crossTouched) {
		defeated = true;
		audio_play_sound(snd_enemy_defeat, 1, false);
		instance_create_layer(x, y - 8 * dir, "Objects", obj_piranha_plant_defeated);
		instance_destroy();
	}
	
	if(koopa) {	
		if(koopa.shellMoving) {
			defeated = true;
			audio_play_sound(snd_enemy_defeat, 1, false);
			instance_create_layer(x, y - 8 * dir, "Objects", obj_piranha_plant_defeated);
			instance_destroy();
		}
	}
}

if(place_meeting(x, y, obj_player) && !dead && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
	mario_damage(3);
}

if(global.playerDead) {
	image_speed = 0;
} else {
	image_speed = 1;
}