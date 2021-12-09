onScreen = x > camera_get_view_x(view_camera[0]) - 30 && 
		   x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 30 &&
		   y > camera_get_view_y(view_camera[0]) - 30 && 
		   y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 30;

if(instance_exists(obj_player)) {
	if(canMove && obj_player.x > x) {
		image_xscale = 1;
	} else if(canMove && obj_player.x < x) {
		image_xscale = -1;
	}
	
	if(obj_player.x < x && obj_player.lastHorizontalDirection == -1 || obj_player.x > x && obj_player.lastHorizontalDirection == 1) {
		canMove = true;
	} else if(obj_player.x < x && obj_player.lastHorizontalDirection == 1 || obj_player.x > x && obj_player.lastHorizontalDirection == -1) {
		canMove = false;
	}

	if(canMove && onScreen) {
		speed = 1;
		sprite_index = spr_boo_moving;
		direction = point_direction(x, y, obj_player.x, obj_player.y - 8);
	} else {
		speed = 0;
		sprite_index = spr_boo_idle;
	}
}