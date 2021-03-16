//Horizontal Movement
if(!hitState)
	currentX = horizontalSpeed * global.horizontal;

//Clamp variables
currentX = clamp(currentX, -xMax, xMax);
currentY = clamp(currentY, -yMax, yMax);

//Step Variables
onGround = place_meeting(x, y + 1, obj_ground_group);
isMoving = !place_meeting(x + global.horizontal, y, obj_ground_group) && global.horizontal != 0;

//Collisions
////Horizontal
if(!place_meeting(x + currentX, y, obj_ground_group) && !hitState) {
	x += currentX;
} else {
	while(!place_meeting(x + sign(currentX), y, obj_ground_group) && !hitState){
		x += sign(currentX);
	}
}

currentY += 0.18;

////Vertical
if(!place_meeting(x, y + round(currentY), obj_ground_group)) {
	y += round(currentY);
} else {
	while(!place_meeting(x, y + sign(currentY), obj_ground_group)) {
		y += sign(currentY);
	}
	currentY = 0;
}

if(onGround && global.jump && global.vertical >= 0 && !hitState) {
	currentY = -5;
	audio_play_sound(snd_mario_jump, 1, false);
}

if(onGround && global.jump && global.vertical < 0) {
	currentY = -5.76;
	audio_play_sound(snd_mario_jump, 1, false);
	audio_play_sound(snd_mario_highjump, 1, false);
}

//Camera
camera_set_view_pos(view_camera[0], round(x - (camera_get_view_width(view_camera[0]) / 2)), round(y));

if(camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) > room_height) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), room_height - camera_get_view_height(view_camera[0]));
} else if (camera_get_view_y(view_camera[0]) < 0) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), 0);
}

if(camera_get_view_x(view_camera[0]) > room_width - camera_get_view_width(view_camera[0])) {
	camera_set_view_pos(view_camera[0], room_width - camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]));
} else if(camera_get_view_x(view_camera[0]) < 0) {
	camera_set_view_pos(view_camera[0], 0, camera_get_view_y(view_camera[0]));
}

depth = 300;

//Hit and invincibility timers
if(hitState)
	hitTimeout += delta_time / 1000000;

if(invincibilityState)
	invincibilityTimeout += delta_time / 1000000;

if(hitState && hitTimeout > 1) {
	hitState = false;
	hitTimeout = 0;
	invincibilityState = true;
}

if(invincibilityState && invincibilityTimeout > 2) {
	invincibilityState = false;
	invincibilityTimeout = 0;
}