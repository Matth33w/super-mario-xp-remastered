deathTimeout = 0;

if(!audio_is_playing(stage_bgm) || !global.continuousMusic) {
	audio_stop_all();
	audio_play_sound(stage_bgm, 1, true);
}

global.lastRoom = room;

stage_fadeout = false;

stage_fadein_offset = -32;
stage_fadeout_offset = -1;

stage_fadeout_timer = 0;

cheep_cheep_timer = 0;