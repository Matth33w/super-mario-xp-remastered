if(place_meeting(x, y, obj_player) && !touched) {
	obj_player.canMove = false;
	obj_stage_manager.stage_fadeout = true;
	touched = true;
}

if(global.smoothTransitions && obj_stage_manager.stage_fadeout_offset >= camera_get_view_width(view_camera[0]) + 64 && obj_stage_manager.stage_fadeout && obj_stage_manager.stage_fadeout_timer > 1 && touched) {
	room_goto(screen_to_advance);
} else if(!global.smoothTransitions && touched) {
	room_goto(screen_to_advance);
}