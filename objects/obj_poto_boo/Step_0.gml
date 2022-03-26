if(!global.playerDead) {
	onScreen = x > camera_get_view_x(view_camera[0]) - 30 && 
		   x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 &&
		   y > camera_get_view_y(view_camera[0]) - 30 && 
		   y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30;

	if(!jump && onScreen)
		timeout += delta_time / 1000000;
	
	particleTimeout += delta_time / 1000000;

	if(!reverse) {
		if(timeout > poto_boo_timeout && !jump) {
			jump = true;
			timeout = 0;
			currentY = -7;
		}

		if(currentY != 0)
			image_yscale = -sign(currentY);

		if(initialY > currentY + y && jump) {
			currentY += 0.14;
			y += currentY;	
		} else {
			currentY = 0;
			jump = false;
			y = initialY;
		}
	} else {
		if(timeout > poto_boo_timeout && !jump) {
			jump = true;
			timeout = 0;
			currentY = 6.5;
		}

		if(currentY != 0)
			image_yscale = -sign(currentY);

		if(initialY < currentY + y && jump) {
			currentY -= 0.14;
			y += currentY;	
		} else {
			currentY = 0;
			jump = false;
			y = initialY;
		}
	}

	if(place_meeting(x, y, obj_player) && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(3);
	}

	if(particleTimeout > 0.05) {
		particleTimeout = 0;
		var instance = instance_create_layer(x, y, "Objects", obj_weapon_particle);
		instance.weapon_type = "fire";
	}
}