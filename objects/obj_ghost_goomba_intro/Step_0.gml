if(image_index >= image_number - 1) {
	var instance = instance_create_layer(x, y - sprite_height / 2 + 3, "Objects", obj_boo);
	instance.skin = "goomba";
	instance.sprite_index = spr_ghost_goomba;
	instance_destroy();
}