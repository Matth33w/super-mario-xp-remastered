audio_stop_all();
audio_play_sound(global.bgm_stage_intro, 1, false);

introTimeout = 0;
fadeOutPos = 0;

array_delete(global.warpsEntered, 0, array_length(global.warpsEntered));