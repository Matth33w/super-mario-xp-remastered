if(instance_exists(obj_player)) {
	if(place_meeting(x, y + abs(obj_player.currentY), obj_player) && 
	    obj_player.currentY < 0 &&
		!place_meeting(x, y, obj_player)
	  )
	{
		obj_player.y = y + obj_player.sprite_height + 8;
		var block = instance_create_layer(x, y, "Objects", obj_item_block);
		block.item_inside = item_inside;
		instance_destroy();
	}
}