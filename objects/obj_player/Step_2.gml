platformInstance = instance_place(x, y + currentY + 1, obj_moving_platform);

if(platformInstance && currentY >= 0 && y < platformInstance.y + 2 && platformInstance.orientation == "horizontal") {
	steppingOnPlatform = true;
	currentY = 0;
	y = platformInstance.y;
	platformHorizontalEffector = platformInstance.platformSpeed * platformInstance.plat_direction;
} else if(platformInstance && currentY >= 0 && y < platformInstance.y + 2 && platformInstance.orientation == "vertical") {
	if(platformInstance.plat_direction == -1) {
		if(platformInstance && currentY >= 0 && obj_player.y < y + 2) {
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