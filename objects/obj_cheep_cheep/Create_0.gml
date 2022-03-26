if(instance_exists(obj_player)) {
	entity_direction = sign(obj_player.x - x);
	
	if(abs(obj_player.x - x) < 100) {
		xSpeed = random_range(1, 1.25);
		ySpeed = random_range(-7, -6);
	} else {
		xSpeed = random_range(2, 3);
		ySpeed = random_range(-7, -5.6);
	}
} else {
	entity_direction = 0
	xSpeed = 0;
	ySpeed = 0;
}
dead = false;

if(entity_direction == 0)
	entity_direction = 1;