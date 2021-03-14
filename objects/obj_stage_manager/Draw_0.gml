draw_sprite_ext(spr_hud_main, 0, camera_get_view_x(view_camera[0]) + 3, camera_get_view_y(view_camera[0]) + 3, 1, 1, 0, c_white, 1);
draw_sprite(spr_life_bar, global.pHealth, camera_get_view_x(view_camera[0]) + 24, camera_get_view_y(view_camera[0]) + 4);
draw_set_font(global.heartsFont);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_text(camera_get_view_x(view_camera[0]) + 52, camera_get_view_y(view_camera[0]) + 20, string(global.hearts));