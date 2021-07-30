if(image_index > 2) {
	image_speed = 0;
}

if(y > room_height + 32) {
	instance_destroy();
}

currentY += 0.3;

y += currentY;