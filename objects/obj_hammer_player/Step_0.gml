initial_vertical += 0.22;
y += initial_vertical;
x += initial_horizontal;

if(hammer_direction == 1) {
	image_angle -= 25;
	image_xscale = 1;
} else if (hammer_direction == -1) {
	image_angle += 25;
	image_xscale = -1;
}

particleTimer += delta_time / 1000000;

if(particleTimer > 0.10) {
	particleTimer = 0;
	instance_create_layer(x, y, "Objects", obj_hammer_particle);
}

depth = -400