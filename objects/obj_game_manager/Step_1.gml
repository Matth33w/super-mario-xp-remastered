global.horizontal = (keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) > 0) - 
					(keyboard_check(vk_left) || gamepad_axis_value(0, gp_axislh) < 0);

global.vertical = (keyboard_check(vk_down) || gamepad_axis_value(0, gp_axislv) > 0) -
				  (keyboard_check(vk_up) || gamepad_axis_value(0, gp_axislv) < 0);

global.jump = (keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_face1));

global.jumpHold = (keyboard_check(vk_shift) || gamepad_button_check(0, gp_face1));

global.start = (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_start));