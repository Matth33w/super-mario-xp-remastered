switch(global.language) {
	case "eng": {
		headerText = "CHOOSE YOUR LANGUAGEM";
		bodyText = "ENGLISH";
		break;
	}
	
	case "ptbr": {
		headerText = "ESCOLHA SEU IDIOMA";
		bodyText = "PORTUGUÊS-BRASIL";
		break;
	}
	
	case "jp": {
		headerText = "言語の選択";
		bodyText = "日本語";
		break;
	}
}

draw_set_color(c_white);
draw_text(room_width / 2, room_height / 2 - 32, headerText);
draw_set_color(c_yellow);
draw_text(room_width / 2, room_height / 2, bodyText);
draw_set_color(c_white);
draw_text(room_width / 2, room_height / 2 + 32, "<< ENTER / START >>");

if(arrCurrent > 0)
	draw_sprite(spr_language_select_left_arrow, 0, room_width / 2 - 126 - sprite_get_width(spr_language_select_left_arrow), room_height / 2);

if(arrCurrent < array_length(arrLanguages) - 1)
	draw_sprite(spr_language_select_right_arrow, 0, room_width / 2 + 126, room_height / 2);