platformInstance = instance_place(x, y + currentY + 1, obj_moving_platform);

if(platformInstance && currentY >= 0 && y < platformInstance.y + 2 && platformInstance.orientation == "horizontal") {
	steppingOnPlatform = true;
	currentY = 0;
	y = platformInstance.y;
	platformHorizontalEffector = platformInstance.platformSpeed * platformInstance.plat_direction;
} else if(platformInstance && currentY >= 0 && y < platformInstance.y + 2 && platformInstance.orientation == "vertical") {
	if(platformInstance.plat_direction == -1) {
		if(platformInstance && currentY >= 0 && obj_player.y < y + 2 && !place_meeting(x, y - 1, obj_ground_group)) {
			currentY = 0;
			y = platformInstance.y;
			steppingOnPlatform = true;
		} else {
			platformVerticalEffector = 0;
		}	
	} else if(platformInstance.plat_direction == 1) {
		if(platformInstance && currentY >= 0 && y < platformInstance.y + 2) {
			currentY = 1;
			steppingOnPlatform = true;
			y = platformInstance.y;
		} else {
			platformVerticalEffector = 0;
		}
	}
}


//Camera
camera_set_view_pos(view_camera[0], (x - (camera_get_view_width(view_camera[0]) / 2)) + camera_offset_x, round(y) + camera_offset_y);

if(camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + camera_offset_y > room_height + camera_offset_y) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), room_height - camera_get_view_height(view_camera[0]));
} else if (camera_get_view_y(view_camera[0]) - camera_offset_y < 0 - camera_offset_y) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), 0);
}

if(camera_get_view_x(view_camera[0]) + camera_offset_x > room_width - camera_get_view_width(view_camera[0])) {
	camera_set_view_pos(view_camera[0], room_width - camera_get_view_width(view_camera[0]) + camera_offset_x, camera_get_view_y(view_camera[0]));
} else if(camera_get_view_x(view_camera[0]) - camera_offset_x < 0 - camera_offset_x) {
	camera_set_view_pos(view_camera[0], 0, camera_get_view_y(view_camera[0]));
}

show_debug_message(steppingOnPlatform);