if(global.playerDead)
	deathTimeout += delta_time / 1000000;
	
if(deathTimeout > 3) {
	global.pHealth = 5;
	global.playerDead = false;
	room_restart();
}