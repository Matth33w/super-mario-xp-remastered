if(!hit && place_meeting(x, y + 1, obj_player)) {
	hit = true;
	audio_play_sound(snd_block_hit, 1, false);
	sprite_index = spr_item_block_destroyed;
	
	switch(item_inside) {
		case "small_heart": {
			var heart = instance_create_layer(x, y, "Objects", obj_heart);
			heart.depth = -400;
			heart.sprite_index = spr_mini_heart;
			global.hearts++;
			break;
		}
		
		case "big_heart": {
			var heart = instance_create_layer(x, y, "Objects", obj_heart);
			heart.depth = -400;
			heart.sprite_index = spr_big_heart;
			global.hearts += 10;
			break;
		}
		
		default: {
			break;	
		}
	}
	
	show_debug_message(global.hearts);
}

if(sprite_index == spr_item_block_destroyed && image_index > 7) {
	image_speed = 0;
}