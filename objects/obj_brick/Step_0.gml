if(place_meeting(x, y + 1, obj_player) && !destroyed){
	audio_play_sound(snd_brick_break, 1, false);
	destroyed = true;
	obj_player.blockHit = true;
	var hitDetector = instance_create_layer(x, y - sprite_height / 2, "Objects", obj_block_hit_detector);
	hitDetector.image_xscale = 0.75;
	hitDetector.image_yscale = 0.75;
	for(var i = 0; i < 4; i++){
		var instance = instance_create_layer(x, y, "Objects", obj_brick_piece);
		instance.secret_brick = secret_brick;
	}
	if(!secret_brick)
		sprite_index = spr_brick_destroyed;
	else
		instance_destroy();
}

if(sprite_index == spr_brick_destroyed && image_index > 5) {
	instance_destroy();
}