if(global.vertical != 0 && !cursorMoved && !selected) {
	currentOption += global.vertical;
	cursorMoved = true;
	audio_play_sound(snd_cursor_move, 1, false);
} else if (global.vertical == 0) {
	cursorMoved = false;
}

if(currentOption < 1)
	currentOption = 3;
else if(currentOption > 3)
	currentOption = 1;

if((global.start || global.jump) && !selected) {
	if(currentOption == 2 && stageCount < 2) {
		return;
	}
	
	selected = true;
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
	audio_play_sound(snd_impact_generic, 1, false);
	image_speed = 2;
}

if(selected)
	timeout += delta_time / 1000000;
	
if(timeout > 2) {
	switch(currentOption) {
		case 1: {
			room_goto(opening);
			break;
		}
		
		case 2: {
			room_goto(stage_select);
			break;
		}
		
		case 3: {
			room_goto(options_screen);
			break;
		}
	}
}