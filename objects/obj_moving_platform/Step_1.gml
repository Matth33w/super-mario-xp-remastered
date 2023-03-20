if(!global.playerDead && active) {
	switch(orientation) {
		case "horizontal": {
			if(!place_meeting(x + platformSpeed * plat_direction, y, obj_moving_platform_switch)) {
				x += platformSpeed * plat_direction;
			} else {
				while(!place_meeting(x + sign(platformSpeed * plat_direction), y, obj_moving_platform_switch)) {
					x += sign(platformSpeed * plat_direction);
				}
			
				plat_direction = -plat_direction;
			}
			break;
		}
	
		case "vertical": {
			if(!place_meeting(x, y + platformSpeed * plat_direction, obj_moving_platform_switch)) {
				y += platformSpeed * plat_direction;
			} else {
				while(!place_meeting(x, y + sign(platformSpeed * plat_direction), obj_moving_platform_switch)) {
					y += sign(platformSpeed * plat_direction);
				}
			
				plat_direction = -plat_direction;
			}
			break;
		}
	}
}

if(instance_exists(obj_player)) {
	if(place_meeting(x, y - 1, obj_player) && !active) {
		active = true;
	}
}

if(y > room_height + 6 && has_teleport)
	y = -6;