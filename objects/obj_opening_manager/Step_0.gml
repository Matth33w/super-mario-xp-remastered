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

if(openingTimeout > 5.5 && openingTimeout < 6) {
	obj_peach_intro.image_xscale = -1;
}

if(openingTimeout > 6 && openingTimeout < 6.5) {
	obj_peach_intro.image_xscale = 1;
}

if(openingTimeout > 6.5 && openingTimeout < 7) {
	obj_peach_intro.image_xscale = -1;
}

if(openingTimeout > 7 && openingTimeout < 7.5) {
	obj_peach_intro.image_xscale = 1;
}

if(openingTimeout > 7.5 && openingTimeout < 8) {
	obj_peach_intro.image_xscale = -1;
}

if(openingTimeout > 8) {
	obj_peach_intro.image_xscale = 1;
}

if(openingTimeout > 5 && obj_peach_intro.y > obj_kamek_intro.y - 4) {
	obj_peach_intro.y -= 1;
}

if(openingTimeout > 7 && cutsceneEvents == 3) {
	obj_kamek_intro.sprite_index = spr_kamek_idle_opening;
	cutsceneEvents++;
}

if(openingTimeout > 9 && cutsceneEvents == 4) {
	switch(global.character) {
		case "mario": {
			audio_play_sound(snd_mario_item_crash_1, 1, false);
			break;
		}
		
		case "luigi": {
			audio_play_sound(snd_luigi_item_crash_1, 1, false);
			break;
		}
	}
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
	switch(global.character) {
		case "mario": {
			obj_mario_intro.sprite_index = spr_mario_intro_1;
			break;
		}
		
		case "luigi": {
			obj_mario_intro.sprite_index = spr_luigi_intro_1;
			break;
		}
	}
} else if(openingTimeout > 14 && obj_mario_intro.x >= 90 && openingTimeout < 15) {
	switch(global.character) {
		case "mario": {
			obj_mario_intro.sprite_index = spr_mario_idle;
			break;
		}
		
		case "luigi": {
			obj_mario_intro.sprite_index = spr_luigi_idle;
			break;
		}
	}
}

if(openingTimeout > 15 && cutsceneEvents == 7) {
	switch(global.character) {
		case "mario": {
			audio_play_sound(snd_poison_mushroom, 1, false);
			obj_mario_intro.sprite_index = spr_mario_intro_2;
			break;
		}
		
		case "luigi": {
			audio_play_sound(snd_luigi_poison_mushroom, 1, false);
			obj_mario_intro.sprite_index = spr_luigi_intro_2;
			break;
		}
	}
	cutsceneEvents++;
	audio_sound_gain(global.bgm_stage7, 0, 3000);
}

if(openingTimeout > 17 && fadeOutPos < 384) {
	fadeOutPos += 12;
}

if(fadeOutPos > 384) {
	fadeOutPos = 384;
}

if(openingTimeout > 18) {
	audio_stop_all();
	audio_sound_gain(global.bgm_stage7, 1, 0);
	room_goto(stage_intro);
}

if(global.start || global.jump) {
	audio_stop_all();
	audio_sound_gain(global.bgm_stage7, 1, 0);
	room_goto(stage_intro);
}

depth = -400;