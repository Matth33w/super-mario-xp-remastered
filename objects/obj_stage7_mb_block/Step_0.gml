if(!activated && place_meeting(x, y + 1, obj_player)) {
	activated = true;
	audio_play_sound(snd_impact, 1, false);
}

if(!activated)
	sprite_index = spr_mb_block;
else
	sprite_index = spr_mb_block_collision;
	
	
if(activated && image_index >= 7)
	activated = false;
