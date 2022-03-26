if(place_meeting(x, y - 1, obj_player)) {
	if(global.jumpHold) {
		obj_player.currentY = -7;
	} else {
		obj_player.currentY = -3;
	}
	audio_play_sound(snd_spring, 1, false);
	sprite_index = spr_spring_bounce;
}

if(sprite_index == spr_spring_bounce && image_index > 2) {
	sprite_index = spr_spring;
}