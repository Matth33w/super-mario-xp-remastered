var movingPlatform = instance_place(x, y, obj_moving_platform);

if(movingPlatform) {
	switch(direction_to_switch) {
		case "up": {
			movingPlatform.orientation = "vertical";
			movingPlatform.plat_direction = -1;
			break;
		}
		
		case "down": {
			movingPlatform.orientation = "vertical";
			movingPlatform.plat_direction = 1;
			break;
		}
		
		case "left": {
			movingPlatform.orientation = "horizontal";
			movingPlatform.plat_direction = -1;
			break;
		}
		
		case "right": {
			movingPlatform.orientation = "horizontal";
			movingPlatform.plat_direction = 1;
			break;
		}
	}
	
	instance_destroy();
}
