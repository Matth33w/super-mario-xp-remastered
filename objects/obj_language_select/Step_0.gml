global.language = arrLanguages[arrCurrent];

if(!pressed && global.horizontal != 0) {
	pressed = true;
	audio_play_sound(snd_cursor_move, 1, false);
	if(arrCurrent == array_length(arrLanguages) - 1 && global.horizontal == 1) {
		audio_stop_sound(snd_cursor_move);
	} else if(arrCurrent == 0 && global.horizontal == -1) {
		audio_stop_sound(snd_cursor_move);
	}
	arrCurrent = clamp(arrCurrent + global.horizontal, 0, array_length(arrLanguages) - 1);
}

if(pressed && global.horizontal == 0) {
	pressed = false;
}

if(global.start)
	room_goto(title_screen);