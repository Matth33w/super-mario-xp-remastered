deathTimeout = 0;

if(!audio_is_playing(stage_bgm) && !audio_is_playing(stage_bgm_loop) || !global.continuousMusic) {
	audio_stop_all();
	
	if(stage_bgm_loop == noone)
		audio_play_sound(stage_bgm, 1, true);
	else
		audio_play_sound(stage_bgm, 1, false);
}

global.lastRoom = room;

stage_fadeout = false;

stage_fadein_offset = -64;
stage_fadeout_offset = -1;

stage_fadeout_timer = 0;

cheep_cheep_timer = 0;