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

if(!audio_is_playing(stage_bgm) && !audio_is_playing(stage_bgm_loop) && stage_bgm_loop != noone) {
	audio_play_sound(stage_bgm_loop, 1, true);
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

if(cheep_cheep_area && !global.playerDead) {
	cheep_cheep_timer += delta_time / 1000000;
	if(cheep_cheep_timer > cheep_cheep_timeout) {
		instance_create_layer(irandom_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32, "Objects", obj_cheep_cheep);
		cheep_cheep_timer = 0;
		if(cheep_cheep_water_sfx)
			audio_play_sound(snd_water, 1, false);
	}
} else {
	cheep_cheep_timer = 0;
}

depth = -5000;