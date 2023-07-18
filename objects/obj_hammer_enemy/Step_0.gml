if(!global.playerDead) {
	initial_vertical += 0.22;
	y += initial_vertical;
	x += initial_horizontal;

	if(hammer_direction == 1) {
		image_angle -= 25;
		image_xscale = 1;
	} else if (hammer_direction == -1) {
		image_angle += 25;
		image_xscale = -1;
	}

	particleTimer += delta_time / 1000000;

	if(particleTimer > 0.10) {
		particleTimer = 0;
		instance_create_layer(x, y, "Objects", obj_weapon_particle);
	}

	depth = -500;
	
	if(place_meeting(x, y, obj_player) && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(2);
	}

	if(x < camera_get_view_x(view_camera[0]) - 30 || 
	   x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 ||
	   y < camera_get_view_y(view_camera[0]) - 100 || 
	   y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30) {
		   instance_destroy();
	}
}