if(active && timeout == 0) {
	x += entity_speed * breaker_direction;
}

if(timeout > 0 && active) {
	timeout -= delta_time / 1000000;
} else if (timeout <= 0 && active) {
	timeout = 0;
}

if(destroyedCount > 2) {
	destroyedCount = 0;
	audio_play_sound(snd_brick_break, 1, false);
}