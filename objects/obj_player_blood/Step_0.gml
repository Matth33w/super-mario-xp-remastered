if(image_index > 6) {
	image_speed = 0;
	instance_destroy();
} else if(!obj_player_dead.canMove) {
	image_speed = 0;
}

if(obj_player_dead.canMove) {
	x += xSpeed;
	y += ySpeed;
	ySpeed -= 0.2;
}