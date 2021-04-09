if(global.playerDead)
	deathTimeout += delta_time / 1000000;
	
if(deathTimeout > 3) {
	global.pHealth = 5;
	global.hearts = 10;
	global.playerDead = false;
	
	if(global.playerLives > 1) {
		global.playerLives--;
		room_goto(lives_screen);
	} else {
		global.playerLives = 5;
		room_goto(gameover);
	}
}

if(stage_fadein_offset < camera_get_view_width(view_camera[0])) {
	stage_fadein_offset += 8;
} else {
	stage_fadein_offset = camera_get_view_width(view_camera[0]);
}

if(stage_fadeout_offset < camera_get_view_width(view_camera[0]) + 64 && stage_fadeout) {
	stage_fadeout_offset += 8;
} else if(stage_fadeout_offset >= camera_get_view_width(view_camera[0]) + 64 && stage_fadeout) {
	stage_fadeout_offset = camera_get_view_width(view_camera[0]) + 64;
}

depth = -5000;