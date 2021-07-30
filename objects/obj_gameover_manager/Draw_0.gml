if(currentSelection == 1)
	draw_sprite_ext(spr_gameover_continue, 0, room_width / 2, room_height / 2 + 18, 1, 1, 0, c_yellow, 1);
else
	draw_sprite_ext(spr_gameover_continue, 0, room_width / 2, room_height / 2 + 18, 1, 1, 0, c_white, 1);


if(currentSelection == 2)
	draw_sprite_ext(spr_gameover_exit, 0, room_width / 2, room_height / 2 + 42, 1, 1, 0, c_yellow, 1);
else
	draw_sprite_ext(spr_gameover_exit, 0, room_width / 2, room_height / 2 + 42, 1, 1, 0, c_white, 1);