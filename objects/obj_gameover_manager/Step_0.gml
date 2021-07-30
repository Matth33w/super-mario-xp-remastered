if(!pressed && global.vertical != 0) {
	pressed = true;
	currentSelection += sign(global.vertical);
} else if (global.vertical == 0) {
	pressed = false;
}

currentSelection = clamp(currentSelection, 1, 2);

if(lastSelection != currentSelection) {
	lastSelection = currentSelection;
	audio_play_sound(snd_cursor_move, 1, false);
}

if(global.start) {
	switch(currentSelection) {
		case 1: {
			room_goto(stage_intro);
			break;
		}
		
		case 2: {
			room_goto(demo);
			break;
		}
	}
}