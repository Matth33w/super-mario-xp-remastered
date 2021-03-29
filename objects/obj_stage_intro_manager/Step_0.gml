introTimeout += delta_time / 1000000;

if(introTimeout > 8) {
	room_goto(lives_screen);
}

if(global.start || global.jump) {
	room_goto(lives_screen);
}