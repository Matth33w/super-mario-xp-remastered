livesTimeout += delta_time / 1000000;

if(livesTimeout > 1) {
	room_goto(global.lastRoom);
}