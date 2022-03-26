if(!global.playerDead) {
	if(x < camera_get_view_x(view_camera[0]) - 30 || 
	   x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 ||
	   y < camera_get_view_y(view_camera[0]) - 30 || 
	   y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30) {
		   instance_destroy();
	}

	if(!specialCross) {
		x += crossSpeed * cross_direction;
	} else {
	
	}

	crossSpeed -= 0.06;

	image_angle += 10 * -cross_direction;

	depth = -500;

	particleTimeout -= delta_time / 1000000;

	if(particleTimeout <= 0) {
		particleTimeout = 0.1;
		var particle = instance_create_layer(x, y, "Objects", obj_weapon_particle);
		particle.weapon_type = "cross";
	}

	if(crossSpeed < 0 && !canCollect) {
		canCollect = true;
	}

	if(place_meeting(x, y, obj_player) && canCollect) {
		instance_destroy();
		audio_play_sound(snd_cross_collect, 1, false);
	}

	if(specialCross) {
		y -= 6;
		x += specialXSpeed;
	}
}