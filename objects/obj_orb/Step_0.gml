if(obj_opening_manager.openingTimeout < 12) {
	x = obj_peach_intro.x;
	y = obj_peach_intro.y - (obj_peach_intro.sprite_height / 2);
}

if(orbEvent == 0 && obj_opening_manager.openingTimeout > 5) {
	image_alpha = 0;
	image_alpha = 0.5;
	orbEvent++;
}

if(obj_opening_manager.openingTimeout >= 12 && x < obj_kamek_intro.x - 19) {
	x += 3;
	sprite_index = spr_orb_2;
	image_alpha = 1;
} else if(obj_opening_manager.openingTimeout >= 12 && x >= obj_kamek_intro.x - 19) {
	audio_play_sound(snd_orb, 1, false);
	instance_destroy();
}