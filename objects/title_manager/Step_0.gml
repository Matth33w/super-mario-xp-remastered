if(global.vertical != 0 && !cursorMoved && !selected) {
	currentOption += global.vertical;
	cursorMoved = true;
	audio_play_sound(snd_cursor_move, 1, false);
} else if (global.vertical == 0) {
	cursorMoved = false;
}

if(currentOption < 1) {
	currentOption = 3;
} else if(currentOption > 3) {
	currentOption = 1;
}

if(global.start && !selected) {
	selected = true;
	audio_play_sound(snd_mario_item_crash_1, 1, false);
	audio_play_sound(snd_impact_generic, 1, false);
	image_speed = 2;
}

if(selected)
	timeout += delta_time / 1000000;
	
if(timeout > 2)
	room_goto(Room1);