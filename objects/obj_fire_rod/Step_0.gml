if(!global.playerDead) {
	angle += 0.035 * rotate_direction;

	x = initialX + 16 * cos(angle) * 4;
	y = initialY + 16 * sin(angle) * 4;

	particle_timeout += delta_time / 1000000;

	if(particle_timeout > 0.05) {
		instance_create_layer(x, y, "Objects", obj_fire_rod_trail);
		particle_timeout = 0;
	}
	
	if(place_meeting(x, y, obj_player) && !obj_player.hitState && !obj_player.invincibilityState && !obj_player.itemCrash) {
		mario_damage(2);
	}
}