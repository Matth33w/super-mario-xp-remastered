if(!global.playerDead) {
	onScreen = x > camera_get_view_x(view_camera[0]) - 30 && 
		   x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 &&
		   y > camera_get_view_y(view_camera[0]) - 30 && 
		   y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30;

	if(instance_exists(obj_player) && !dead) {
		if(canMove && obj_player.x > x) {
			image_xscale = 1;
		} else if(canMove && obj_player.x < x) {
			image_xscale = -1;
		}
	
		if(obj_player.x < x && obj_player.lastHorizontalDirection == -1 || obj_player.x > x && obj_player.lastHorizontalDirection == 1) {
			canMove = true;
		} else if(obj_player.x < x && obj_player.lastHorizontalDirection == 1 || obj_player.x > x && obj_player.lastHorizontalDirection == -1) {
			canMove = false;
		}

		if(canMove && onScreen) {
			speed = 0.5;
			switch(skin) {
				case "goomba": {
					sprite_index = spr_ghost_goomba;
					break;
				}
				
				default: {
					sprite_index = spr_boo_moving;
					break;
				}
			}
			direction = point_direction(x, y, obj_player.x, obj_player.y - 8);
		} else {
			speed = 0;
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
		}
	}

	if(!dead && place_meeting(x, y, obj_cross)) {			
		dead = true;
		ySpeed = -5;
		audio_play_sound(snd_enemy_defeat, 1, false);
	}

	if(dead) {
		speed = 0;
		ySpeed += 0.2;
		y += ySpeed;
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
		image_yscale = -1;
	}

	if(dead && y > room_height + 10) {
		instance_destroy();
	}

	if(place_meeting(x, y, obj_player) && !dead && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(2);
	}
} else {
	speed = 0;
	image_speed = 0;
}