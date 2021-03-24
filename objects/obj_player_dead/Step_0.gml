if(canMove) {
	x += xSpeed;
	y += ySpeed;
	for(var i = 0; i < 2; i++) {
		instance_create_layer(x, y, "Objects", obj_player_blood);
	}
	ySpeed += 0.2;
}

if(canMove && ySpeed > 2) {
	canMove = false;
	global.playerDead = true;
	audio_play_sound(bgm_death_jingle_remaster, 1, false);
	image_speed = 0;
}

depth = -20;