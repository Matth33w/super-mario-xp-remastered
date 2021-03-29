if(global.playerDead)
	deathTimeout += delta_time / 1000000;
	
if(deathTimeout > 3) {
	global.pHealth = 5;
	global.hearts = 10;
	global.playerDead = false;
	
	if(global.playerLives > 1) {
		global.playerLives--;
		room_goto(lives_screen);
	} else {
		global.playerLives = 5;
		show_message("GAME-OVER");
	}
}