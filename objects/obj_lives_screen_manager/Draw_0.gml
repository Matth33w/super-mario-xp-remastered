draw_sprite(spr_mario_lives, 0, (room_width / 2) - 26, (room_height / 2));
draw_set_font(global.livesFont);

draw_text((room_width / 2) + 26, (room_height / 2) - 2, global.playerLives);