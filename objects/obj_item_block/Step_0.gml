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
		
		case "mushroom": {
			var mushroom = instance_create_layer(x, y + (sprite_height / 2), "Objects", obj_mushroom);
			mushroom.mushroomType = "normal";
			audio_play_sound(snd_item_appear, 1, false);
			break;
		}
		
		case "poison_mushroom": {
			var mushroom = instance_create_layer(x, y + (sprite_height / 2), "Objects", obj_mushroom);
			mushroom.mushroomType = "poisoned";
			audio_play_sound(snd_item_appear, 1, false);
			break;
		}
		
		case "life_mushroom": {
			var mushroom = instance_create_layer(x, y + (sprite_height / 2), "Objects", obj_mushroom);
			mushroom.mushroomType = "life";
			audio_play_sound(snd_item_appear, 1, false);
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

if(!box_visible && !hit) {
	image_alpha = 0;
} else {
	image_alpha = 1;
}