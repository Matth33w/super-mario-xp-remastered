if(global.playerDead)
	deathTimeout += delta_time / 1000000;
	
if(deathTimeout > 3) {
	global.pHealth = 5;
	global.hearts = 10;
	global.playerWeapon = "none";
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
	stage_fadeout_timer += delta_time / 1000000;
}

if(global.parallaxScrolling) {
	layer_x("Background_1", camera_get_view_x(view_camera[0]) / 4 + background1_offset_x);
	layer_x("Background_2", camera_get_view_x(view_camera[0]) / 2 + background2_offset_x);

	layer_y("Background_1", camera_get_view_y(view_camera[0]) / 4 + background1_offset_y);
	layer_y("Background_2", camera_get_view_y(view_camera[0]) / 2 + background2_offset_y);
}

depth = -5000;