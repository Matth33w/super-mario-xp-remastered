openingTimeout += delta_time / 1000000;

if(openingTimeout > 3 && cutsceneEvents == 0) {
	obj_kamek_intro.x = 220;
	obj_kamek_intro.y = 100;
	cutsceneEvents++;
}

if(openingTimeout > 9 && cutsceneEvents == 1) {
	audio_play_sound(snd_mario_item_crash_1, 1, false);
	cutsceneEvents++;
}

if(openingTimeout > 15 && cutsceneEvents == 2) {
	audio_play_sound(snd_poison_mushroom, 1, false);
	cutsceneEvents++;
}

if(openingTimeout > 18) {
	audio_stop_all();
	room_goto(Room1);
}