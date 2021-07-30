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

onScreen = x > camera_get_view_x(view_camera[0]) - 30 && 
		   x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 &&
		   y > camera_get_view_y(view_camera[0]) - 30 && 
		   y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30;

if(onScreen && !global.playerDead) {
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

if(place_meeting(x, y, obj_player) && !dead && !obj_player.hitState && !obj_player.invincibilityState) {
	mario_damage(3);
}

if(global.playerDead) {
	image_speed = 0;
} else {
	image_speed = 1;
}