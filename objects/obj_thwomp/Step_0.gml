if(!global.playerDead) {
	if(verticalDirection == 1) {
		sprite_index = spr_thwomp_down;
	} else if(verticalDirection == -1) {
		sprite_index = spr_thwomp_up;
	}
	
	if(place_meeting(x, y, obj_ground_group)) {
		while(place_meeting(x, y, obj_ground_group)) {
			y--;
		}
	}

	onScreen = x > camera_get_view_x(view_camera[0]) - 30 && 
			   x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 &&
			   y > camera_get_view_y(view_camera[0]) - 30 && 
			   y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30;

	if(onScreen) {
		if(timeout > 0) {
			timeout -= delta_time / 1000000;
		} else if(timeout <= 0) {
			timeout = 0;
		}

		if(verticalDirection == 1 && !place_meeting(x, y + 3, obj_ground_group) && timeout == 0) {
			y += 3;
		} else if(verticalDirection == 1 && !place_meeting(x, y + 1, obj_ground_group) && timeout == 0) {
			while(!place_meeting(x, y + 1, obj_ground_group) && timeout == 0) {
				y += 1;
			}
		}

		if(verticalDirection == -1 && !place_meeting(x, y - 1, obj_ground_group)) {
			y += -0.75;
		} else if(verticalDirection == -1 && !place_meeting(x, y - 1, obj_ground_group)) {
			while(!place_meeting(x, y - 1, obj_ground_group)) {
				y += -1;
			}
		}

		if(verticalDirection == 1 && place_meeting(x, y + 1, obj_ground_group)) {
			verticalDirection = -1;
			audio_play_sound(snd_impact_generic, 1, false);
		} else if(verticalDirection == -1 && place_meeting(x, y - 1, obj_ground_group)) {
			verticalDirection = 1;
			timeout = 0.5;
		}
	}

	if(place_meeting(x, y, obj_player) && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(3);
	}
}