entity_direction = 0;

if(instance_exists(obj_player)) {
	entity_direction = sign(obj_player.x - x);
	xSpeed = 1.5;
	ySpeed = 0;
} else {
	entity_direction = 0;
	xSpeed = 0;
	ySpeed = 0;
}
dead = false;
initialOrder = true;

if(entity_direction == 0)
	entity_direction = 1;