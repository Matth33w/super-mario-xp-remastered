if(global.debug) {
	if(keyboard_check_pressed(ord("1"))) {
		surface_resize(application_surface, 320, 240);
	}

	if(keyboard_check_pressed(ord("2"))) {
		surface_resize(application_surface, 320 * 2, 240 * 2);
	}

	if(keyboard_check_pressed(ord("3"))) {
		surface_resize(application_surface, 320 * 3, 240 * 3);
	}
	
	if(keyboard_check_pressed(ord("4"))) {
		global.playerWeapon = "fire_flower";
	}

	if(keyboard_check_pressed(ord("5"))) {
		global.playerWeapon = "hammer";
	}

	if(keyboard_check_pressed(ord("6"))) {
		global.playerWeapon = "cross";
	}
	
	if(keyboard_check_pressed(ord("7"))) {
		global.hearts = 99;
	}
	
	if(keyboard_check_pressed(vk_numpad1)) {
		global.currentStage = 1;
	}
	
	if(keyboard_check_pressed(vk_numpad2)) {
		global.currentStage = 2;
	}
	
	if(keyboard_check_pressed(vk_numpad3)) {
		global.currentStage = 3;
	}
	
	if(keyboard_check_pressed(vk_numpad4)) {
		global.currentStage = 4;
	}
	
	if(keyboard_check_pressed(vk_numpad7)) {
		global.currentStage = 7;
	}
	
	if(keyboard_check_pressed(ord("Q"))) {
		global.pHealth = 0;
	}
}

global.playerLives = clamp(global.playerLives, 0, 128);