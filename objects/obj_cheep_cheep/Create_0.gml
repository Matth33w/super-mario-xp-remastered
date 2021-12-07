entity_direction = sign(obj_player.x - x);

if(entity_direction == 0)
	entity_direction = 1;
	
if(abs(obj_player.x - x) < 100) {
	xSpeed = random_range(1, 1.25);
	ySpeed = random_range(-7, -6);
} else {
	xSpeed = random_range(2, 3);
	ySpeed = random_range(-7, -5.6);
}