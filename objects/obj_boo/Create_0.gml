canMove = false;

if(instance_exists(obj_player)) {
	if(obj_player.x > x) {
		image_xscale = 1;
	} else if(obj_player.x < x) {
		image_xscale = -1;
	}
}