switch(global.language) {
	case "eng": {
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text(room_width / 2, 8 * 2, "OPTIONS");
		draw_set_halign(fa_left);
		draw_set_color(arrCurrent == 0 ? c_yellow : c_white);
		draw_text(16, 8 * 4, "Character:");
		switch(global.character) {
			case "mario": {
				draw_text(16, 8 * 6, "MARIO");
				break;
			}
			
			case "luigi": {
				draw_text(16, 8 * 6, "LUIGI");
				break;
			}
		}
		draw_set_color(arrCurrent == 1 ? c_yellow : c_white);
		draw_text(16, 8 * 9, "Music style:");
		switch(musicList[arrMusicCurrent]) {
			case "remastered": {
				draw_text(16, 8 * 11, "REMASTERED");
				break;
			}
			
			case "original": {
				draw_text(16, 8 * 11, "ORIGINAL");
				break;
			}
			
			case "snes": {
				draw_text(16, 8 * 11, "SUPER NINTENDO");
				break;
			}
		};
		draw_set_color(arrCurrent == 2 ? c_yellow : c_white);
		draw_text(16, 8 * 14, "Parallax:");
		switch(global.parallaxScrolling) {
			case true: {
				draw_text(16, 8 * 16, "ACTIVATED");
				break;
			}
			
			case false: {
				draw_text(16, 8 * 16, "DEACTIVATED");
				break;
			}
		};
		draw_set_color(arrCurrent == 3 ? c_yellow : c_white);
		draw_text(16, room_height - 8 * 2, "Exit");
		break;
	}
	
	case "ptbr": {
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text(room_width / 2, 8 * 2, "AJUSTES");
		draw_set_halign(fa_left);
		draw_set_color(arrCurrent == 0 ? c_yellow : c_white);
		draw_text(16, 8 * 4, "Personagem:");
		switch(global.character) {
			case "mario": {
				draw_text(16, 8 * 6, "MARIO");
				break;
			}
			
			case "luigi": {
				draw_text(16, 8 * 6, "LUIGI");
				break;
			}
		}
		draw_set_color(arrCurrent == 1 ? c_yellow : c_white);
		draw_text(16, 8 * 9, "Estilo de música:");
		switch(musicList[arrMusicCurrent]) {
			case "remastered": {
				draw_text(16, 8 * 11, "REMASTERED");
				break;
			}
			
			case "original": {
				draw_text(16, 8 * 11, "ORIGINAL");
				break;
			}
			
			case "snes": {
				draw_text(16, 8 * 11, "SUPER NINTENDO");
				break;
			}
		};
		draw_set_color(arrCurrent == 2 ? c_yellow : c_white);
		draw_text(16, 8 * 14, "Parallax:");
		switch(global.parallaxScrolling) {
			case true: {
				draw_text(16, 8 * 16, "ATIVADO");
				break;
			}
			
			case false: {
				draw_text(16, 8 * 16, "DESATIVADO");
				break;
			}
		};
		draw_set_color(arrCurrent == 3 ? c_yellow : c_white);
		draw_text(16, room_height - 8 * 2, "Sair");
		break;
	}
	
	case "jp": {
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text(room_width / 2, 8 * 2, "OPTIONS");
		draw_set_halign(fa_left);
		draw_set_color(arrCurrent == 0 ? c_yellow : c_white);
		draw_text(16, 8 * 4, "Character:");
		switch(global.character) {
			case "mario": {
				draw_text(16, 8 * 6, "MARIO");
				break;
			}
			
			case "luigi": {
				draw_text(16, 8 * 6, "LUIGI");
				break;
			}
		}
		draw_set_color(arrCurrent == 1 ? c_yellow : c_white);
		draw_text(16, 8 * 9, "Music style:");
		switch(musicList[arrMusicCurrent]) {
			case "remastered": {
				draw_text(16, 8 * 11, "REMASTERED");
				break;
			}
			
			case "original": {
				draw_text(16, 8 * 11, "ORIGINAL");
				break;
			}
			
			case "snes": {
				draw_text(16, 8 * 11, "SUPER NINTENDO");
				break;
			}
		};
		draw_set_color(arrCurrent == 2 ? c_yellow : c_white);
		draw_text(16, 8 * 14, "Parallax:");
		switch(global.parallaxScrolling) {
			case true: {
				draw_text(16, 8 * 16, "ACTIVATED");
				break;
			}
			
			case false: {
				draw_text(16, 8 * 16, "DEACTIVATED");
				break;
			}
		};
		draw_set_color(arrCurrent == 3 ? c_yellow : c_white);
		draw_text(16, room_height - 8 * 2, "Exit");
		break;
	}
}