if(place_meeting(x, y + 1, obj_player) && !destroyed){
	audio_play_sound(snd_brick_break, 1, false);
	destroyed = true;
	obj_player.blockHit = true;
	for(var i = 0; i < 4; i++){
		instance_create_layer(x, y, "Objects", obj_brick_piece);
	}
	sprite_index = spr_brick_destroyed;
}

if(sprite_index == spr_brick_destroyed && image_index > 5) {
	instance_destroy();
}