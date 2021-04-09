if(instance_exists(obj_player)) {
	if(place_meeting(x, y + abs(obj_player.currentY), obj_player) && 
	   !place_meeting(x - 1, y, obj_player) &&
	   !place_meeting(x + 1, y, obj_player) &&
	    obj_player.currentY < 0 &&
		obj_player.x < x + 7 &&
		obj_player.x > x - 7
	  )
	{
		var block = instance_create_layer(x, y, "Objects", obj_item_block);
		block.item_inside = item_inside;
		instance_destroy();
	}
}