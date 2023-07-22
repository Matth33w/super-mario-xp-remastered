if(instance_exists(obj_player)) {
	if(obj_player.y > 240 && !lakituSpawned) {
		lakituSpawned = true;
		var lakitu = instance_create_layer(160, 0, "Objects", obj_lakitu);
		lakitu.image_speed = 5;
	}
}