if(!hit && place_meeting(x, y + 1, obj_player)) {
	hit = true;
	audio_play_sound(snd_block_hit, 1, false);
	obj_player.blockHit = true;
	var hitDetector = instance_create_layer(x, y - sprite_height / 2, "Objects", obj_block_hit_detector);
	hitDetector.image_xscale = 0.5;
	hitDetector.image_yscale = 0.5;
	if(instance_exists(obj_stage_manager)) {
		switch(obj_stage_manager.stage_theme) {
			case "underworld": {
				sprite_index = spr_item_block_destroyed_underworld;
				break;
			}
			
			case "castle": {
				sprite_index = spr_item_block_destroyed_castle;
				break;
			}
			
			default: {
				sprite_index = spr_item_block_destroyed;
				break;
			}
		}	
	} else {
		sprite_index = spr_item_block_destroyed;
	}
	
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
			global.hearts += 5;
			break;
		}
		
		case "fire_flower": {
			var weapon = instance_create_layer(x, y - 8, "Objects", obj_weapon);
			audio_play_sound(snd_item_appear, 1, false);
			break;
		}
		
		case "hammer": {
			var weapon = instance_create_layer(x, y - 8, "Objects", obj_weapon);
			weapon.weapon_type = "hammer";
			audio_play_sound(snd_item_appear, 1, false);
			break;
		}
		
		case "cross": {
			var weapon = instance_create_layer(x, y - 8, "Objects", obj_weapon);
			weapon.weapon_type = "cross";
			audio_play_sound(snd_item_appear, 1, false);
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

if(hit && image_index > 7) {
	image_speed = 0;
}