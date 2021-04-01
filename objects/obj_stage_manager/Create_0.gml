deathTimeout = 0;

if(!audio_is_playing(stage_bgm) || !global.continuousMusic) {
	audio_stop_all();
	audio_play_sound(stage_bgm, 1, true);
}

global.lastRoom = room;