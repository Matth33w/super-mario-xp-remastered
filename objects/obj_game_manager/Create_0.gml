global.hearts = 10;
global.pHealth = 5;

global.weapon = 0;

global.heartsFont = font_add_sprite_ext(spr_heart_counter, "0123456789-", true, 2);
global.livesFont = font_add_sprite_ext(spr_lives_font, "0123456789-", true, 4);

global.pause = false;

global.playerDead = false;

global.currentStage = 1;

global.playerLives = 5;

set_soundtrack("remastered");

global.continuousMusic = true;