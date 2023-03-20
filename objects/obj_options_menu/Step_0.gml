if(!pressed && global.vertical != 0) {
	pressed = true;
	audio_play_sound(snd_cursor_move, 1, false);
	if(arrCurrent == array_length(arrProps) - 1 && global.vertical == 1) {
		audio_stop_sound(snd_cursor_move);
	} else if(arrCurrent == 0 && global.vertical == -1) {
		audio_stop_sound(snd_cursor_move);
	}
	arrCurrent = clamp(arrCurrent + global.vertical, 0, array_length(arrProps) - 1);
}

if(!pressedOption && global.horizontal != 0) {
	pressedOption = true;
	audio_play_sound(snd_cursor_move, 1, false);
	switch(arrCurrent) {
		case 0: {
			if(arrCharacterCurrent == array_length(characterList) - 1 && global.horizontal == 1) {
				audio_stop_sound(snd_cursor_move);
			} else if(arrCharacterCurrent == 0 && global.horizontal == -1) {
				audio_stop_sound(snd_cursor_move);
			}
			arrCharacterCurrent = clamp(arrCharacterCurrent + global.horizontal, 0, array_length(characterList) - 1);
			break;
		}
		
		case 1: {
			if(arrMusicCurrent == array_length(musicList) - 1 && global.horizontal == 1) {
				audio_stop_sound(snd_cursor_move);
			} else if(arrMusicCurrent == 0 && global.horizontal == -1) {
				audio_stop_sound(snd_cursor_move);
			}
			arrMusicCurrent = clamp(arrMusicCurrent + global.horizontal, 0, array_length(musicList) - 1);
			break;
		}
		
		case 2: {
			if(arrParallaxCurrent == array_length(parallaxActivated) - 1 && global.horizontal == 1) {
				audio_stop_sound(snd_cursor_move);
			} else if(arrParallaxCurrent == 0 && global.horizontal == -1) {
				audio_stop_sound(snd_cursor_move);
			}
			arrParallaxCurrent = clamp(arrParallaxCurrent + global.horizontal, 0, array_length(parallaxActivated) - 1);
			break;
		}
	}
}

switch(arrCurrent) {
	case 0: {
		global.character = characterList[arrCharacterCurrent];
		break;
	}
	
	case 1: {
		set_soundtrack(musicList[arrMusicCurrent]);
		break;
	}
	
	case 2: {
		global.parallaxScrolling = parallaxActivated[arrParallaxCurrent];
		break;
	}
}

if(pressed && global.vertical == 0) {
	pressed = false;
}

if(pressedOption && global.horizontal == 0) {
	pressedOption = false;
}

if(global.start)
	room_goto(title_screen);