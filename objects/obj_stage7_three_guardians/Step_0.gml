if(instance_exists(obj_player)) {
	if(obj_player.x < 0 && !allDefeated) {
		obj_player.x = 320;
	} else if(obj_player.x > 320) {
		obj_player.x = 0;
	}
}