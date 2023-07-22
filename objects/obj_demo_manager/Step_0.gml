demoTimeout += delta_time / 1000000;

if(demoTimeout > 1) {
	layer_hspeed("Fade_In", 8);
}

if(demoTimeout > 3) {
	room_goto(stage_3_2);
}