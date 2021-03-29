y -= 0.4;
indicatorTimeout += delta_time / 1000000;

if(indicatorTimeout > 0.75) {
	instance_destroy();
}

depth = -500;