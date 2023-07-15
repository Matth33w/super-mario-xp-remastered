timeout += delta_time / 1000000;

if(timeout > .25) {
	instance_destroy();
}