y -= verticalSpeed;

if(verticalSpeed > 0) {
	verticalSpeed -= 0.5;
} else {
	verticalSpeed = 0;
}

timeout += delta_time / 1000000;

if(timeout > 0.5) {
	instance_destroy();
	audio_play_sound(snd_heart, 1, false);
}