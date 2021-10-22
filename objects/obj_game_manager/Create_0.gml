global.hearts = 10;
global.pHealth = 5;

global.heartsFont = font_add_sprite_ext(spr_heart_counter, "0123456789-", true, 2);
global.livesFont = font_add_sprite_ext(spr_lives_font, "0123456789-", true, 4);
global.whiteFont1 = font_add_sprite_ext(spr_font_stage_select, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-", true, 2);

global.pause = false;

global.playerDead = false;
global.debug = true;

global.currentStage = 1;

global.playerLives = 5;

global.playerWeapon = "none";

global.startX = -1;
global.startY = -1;

global.initialWarping = false;
global.initialWarpDirection = "none";

global.screenToWarp = noone;

global.warpsEntered = [];

set_soundtrack("original");

//Dipswitches
global.continuousMusic = false;
global.smoothTransitions = false;
global.parallaxScrolling = false;

global.oneHit = false;

//window_set_fullscreen(true);
surface_resize(application_surface, 320, 240);