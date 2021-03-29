openingTimeout += delta_time / 1000000;

if(openingTimeout > 3 && cutsceneEvents == 0) {
	obj_kamek_intro.x = 240;
	obj_kamek_intro.y = 100;
	audio_play_sound(snd_kamek_1, 1, false);
	cutsceneEvents++;
}

if(openingTimeout > 4 && cutsceneEvents == 1) {
	obj_kamek_intro.sprite_index = spr_kamek_idle_opening;
	cutsceneEvents++;
}

if(openingTimeout > 5 && cutsceneEvents == 2) {
	audio_play_sound(snd_kamek_magic, 1, false);
	obj_kamek_intro.sprite_index = spr_kamek_spell_1_opening;
	cutsceneEvents++;
}

if(openingTimeout > 5 && obj_peach_intro.y > obj_kamek_intro.y - 4) {
	obj_peach_intro.y -= 1;
}

if(openingTimeout > 7 && cutsceneEvents == 3) {
	obj_kamek_intro.sprite_index = spr_kamek_idle_opening;
	cutsceneEvents++;
}

if(openingTimeout > 9 && cutsceneEvents == 4) {
	audio_play_sound(snd_mario_item_crash_1, 1, false);
	cutsceneEvents++;
}

if(openingTimeout > 12 && cutsceneEvents == 5) {
	audio_play_sound(snd_kamek_magic, 1, false);
	audio_play_sound(snd_kamek_1, 1, false);
	obj_peach_intro.image_alpha = 0;
	cutsceneEvents++;
}

if(openingTimeout > 14 && cutsceneEvents == 6) {
	audio_play_sound(snd_kamek_1, 1, false);
	cutsceneEvents++;
}

if(openingTimeout > 14) {
	obj_kamek_intro.y -= 4;
	obj_kamek_intro.x += 4;
}

if(openingTimeout > 14 && obj_mario_intro.x < 90 && openingTimeout < 15) {
	obj_mario_intro.x += 3;
	obj_mario_intro.sprite_index = spr_mario_intro_1;
} else if(openingTimeout > 14 && obj_mario_intro.x >= 90 && openingTimeout < 15) {
	obj_mario_intro.sprite_index = spr_mario_idle;
}

if(openingTimeout > 15 && cutsceneEvents == 7) {
	audio_play_sound(snd_poison_mushroom, 1, false);
	obj_mario_intro.sprite_index = spr_mario_intro_2;
	cutsceneEvents++;
}

if(openingTimeout > 18) {
	audio_stop_all();
	room_goto(stage_intro);
}

if(global.start || global.jump) {
	room_goto(stage_intro);
}