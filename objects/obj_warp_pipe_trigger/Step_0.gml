if(place_meeting(x, y, obj_player) && !obj_player.warpState && initial_direction == "down" && global.vertical > 0 && canEnter) {
	obj_player.canMove = false;
	obj_player.warpState = true;
	obj_player.warpChangeScreen = true;
	obj_player.warpDirection = "down";
	global.initialWarpDirection = endpoint_direction;
	obj_player_sprite.sprite_index = spr_mario_crouch;
	obj_player.x = x;
	obj_player.y = y;
	obj_player.warpYLimit = obj_player.y + 32;
	global.screenToWarp = screen_warp;
	global.initialWarping = true;
	global.startX = endpoint_initial_x;
	global.startY = endpoint_initial_y;
	audio_play_sound(snd_warp_pipe, 1, false);
	if(enterOnce)
		array_push(global.warpsEntered, warp_id);
}

if(place_meeting(x, y, obj_player) && !obj_player.warpState && initial_direction == "up" && global.vertical < 0 && canEnter) {
	obj_player.canMove = false;
	obj_player.currentY = 0;
	obj_player.warpState = true;
	obj_player.warpChangeScreen = true;
	obj_player.warpDirection = "up";
	global.initialWarpDirection = endpoint_direction;
	obj_player.x = x;
	obj_player.y = y + 16;
	obj_player.warpYLimit = obj_player.y - 32;
	global.screenToWarp = screen_warp;
	global.initialWarping = true;
	global.startX = endpoint_initial_x;
	global.startY = endpoint_initial_y;
	audio_play_sound(snd_warp_pipe, 1, false);
	if(enterOnce)
		array_push(global.warpsEntered, warp_id);
}