if(place_meeting(x, y, obj_player)) {
	obj_player.canMove = false;
	obj_stage_manager.stage_fadeout = true;
	
	if(global.smoothTransitions && obj_stage_manager.stage_fadeout_offset >= camera_get_view_width(view_camera[0]) + 64 && obj_stage_manager.stage_fadeout) {
		room_goto(screen_to_advance);
	} else if(!global.smoothTransitions) {
		room_goto(screen_to_advance);
	}
}