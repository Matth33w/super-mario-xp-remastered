if(global.parallaxScrolling) {
	layer_x("Background_1", camera_get_view_x(view_camera[0]) / 4 + background1_offset_x);
	layer_x("Background_1_1", camera_get_view_x(view_camera[0]) / 4 + background1_offset_x);
	layer_x("Background_2", camera_get_view_x(view_camera[0]) / 2 + background2_offset_x);
	layer_x("Background_3", camera_get_view_x(view_camera[0]) / 1.5 + background3_offset_x);

	layer_y("Background_1", camera_get_view_y(view_camera[0]) / 4 + background1_offset_y);
	layer_y("Background_1_1", camera_get_view_y(view_camera[0]) / 4 + background1_offset_y);
	layer_y("Background_2", camera_get_view_y(view_camera[0]) / 2 + background2_offset_y);
	layer_y("Background_3", camera_get_view_y(view_camera[0]) / 1.5 + background3_offset_y);
}

if(global.playerDead) {
	layer_background_speed(layer_background_get_id(layer_get_id("Background_1")), 0);
}