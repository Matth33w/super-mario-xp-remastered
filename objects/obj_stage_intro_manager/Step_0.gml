introTimeout += delta_time / 1000000;

if(introTimeout > 8) {
	room_goto(lives_screen);
}

if(introTimeout > 7) {
	fadeOutPos += 12;
}

if(fadeOutPos > 384) {
	fadeOutPos = 384;
}

if(global.start || global.jump) {
	room_goto(lives_screen);
}

depth = -401;