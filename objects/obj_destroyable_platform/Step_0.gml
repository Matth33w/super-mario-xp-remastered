if(place_meeting(x, y, obj_platform_breaker)) {
	obj_platform_breaker.destroyedCount += 1;
	instance_create_layer(x, y, "Objects", obj_destroyable_platform_particle);
	instance_destroy();
}