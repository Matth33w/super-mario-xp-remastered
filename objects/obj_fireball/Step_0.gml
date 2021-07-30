x += fireballSpeed * fire_direction;

currentY += 0.2;

image_angle += 20 * -fire_direction;

if(place_meeting(x, y + currentY + 1, obj_ground_group) && currentY > 0) {
	while(!place_meeting(x, y + 1, obj_ground_group)) {
		y += 1;
	}
	currentY = -2;
}

if(place_meeting(x + round(fireballSpeed), y, obj_ground_group)) {
	while(!place_meeting(x + sign(fireballSpeed), y, obj_ground_group)) {
		x += sign(fireballSpeed);
	}
	
	instance_destroy();
}

y += round(currentY);

particleTimeout -= delta_time / 1000000;

if(particleTimeout <= 0) {
	particleTimeout = 0.1;
	var particle = instance_create_layer(x, y, "Objects", obj_weapon_particle);
	particle.weapon_type = "fire";
}

if(x < camera_get_view_x(view_camera[0]) - 30 || 
   x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 ||
   y < camera_get_view_y(view_camera[0]) - 30 || 
   y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30) {
	   instance_destroy();
}