if(!global.playerDead && !defeated) {
	y = camera_get_view_y(view_camera[0]) + yPoint;
	
	if(yPoint < yPointMax) {
		yPoint += 0.5;
	}
	
	if(entityDirection == 1 && x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - screenLimit) {
		entityDirection = -1;
	} else if(entityDirection == -1 && x < camera_get_view_x(view_camera[0]) + screenLimit) {
		entityDirection = 1;
	}
	
	if(entityDirection == global.horizontal) {
		x += entityDirection * 2;
	} else if(entityDirection == -global.horizontal) {
		x += entityDirection * 0.5;
	} else {
		x += entityDirection * 1;
	}
}