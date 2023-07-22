if(room != stage_3_2 && instance_number(obj_lakitu) == 0) {
	lakituTimeout += delta_time / 1000000;
	
	if(lakituTimeout > 8) {
		instance_create_layer(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - 16, "Objects", obj_lakitu);
		lakituTimeout = 0;
	}
}