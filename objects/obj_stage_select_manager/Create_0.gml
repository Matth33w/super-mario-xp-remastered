audio_stop_all();
audio_play_sound(bgm_stageselect_remaster, 1, true);

currentSelection = 0;
stageValues = [];

for(var i = 1; i <= load_property("currentStage"); i++) {
	stageValues[i-1] = i;
}

currentSelection = array_length(stageValues) - 1;

pressed = false;