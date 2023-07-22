if(instance_exists(obj_player)) {
	if(obj_player.y > 8640 && fallLoop) {
		obj_player.y = 800;
		obj_player_sprite.x = obj_player.x;
		obj_player_sprite.y = obj_player.y;
		//Camera
		camera_set_view_pos(view_camera[0], (obj_player.x - (camera_get_view_width(view_camera[0]) / 2)) + obj_player.camera_offset_x, round(obj_player.y) + obj_player.camera_offset_y);

		if(camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + obj_player.camera_offset_y > room_height + obj_player.camera_offset_y) {
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), room_height - camera_get_view_height(view_camera[0]));
		} else if (camera_get_view_y(view_camera[0]) - obj_player.camera_offset_y < 0 - obj_player.camera_offset_y) {
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), 0);
		}

		if(camera_get_view_x(view_camera[0]) + obj_player.camera_offset_x > room_width - camera_get_view_width(view_camera[0])) {
			camera_set_view_pos(view_camera[0], room_width - camera_get_view_width(view_camera[0]) + obj_player.camera_offset_x, camera_get_view_y(view_camera[0]));
		} else if(camera_get_view_x(view_camera[0]) - obj_player.camera_offset_x < 0 - obj_player.camera_offset_x) {
			camera_set_view_pos(view_camera[0], 0, camera_get_view_y(view_camera[0]));
		}
	}

	if(obj_player.y < 2000 && !instance_exists(obj_weapon)) {
		var instance = instance_create_layer(168, 8248, "Objects", obj_weapon);
		instance.weapon_type = "cross";
	}
	
	fallLoop = instance_number(obj_lakitu) > 0;
}