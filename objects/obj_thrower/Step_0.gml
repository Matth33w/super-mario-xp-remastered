onCamera =  (x - sprite_width - 32) < (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && 
			(x + sprite_width + 32) > camera_get_view_x(view_camera[0]) &&
			(y - sprite_height) < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) &&
			(y + sprite_height > camera_get_view_y(view_camera[0]));
			
			
if(onCamera)
	counter += delta_time / 1000000;
	
if(counter >= 3) {
	counter = 0;
	instance_create_layer(x, y, "Objects", obj_bullet_bill);
	audio_play_sound(snd_impact_generic, 1, false);
}