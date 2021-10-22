// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_bounce(){
	if(obj_player.enemyBounce >= 8) {
		global.playerLives += 1;
		instance_create_layer(x, y - 6, "Objects", obj_1up_indicator);
		if(!audio_is_playing(snd_life_up)) {
			audio_play_sound(snd_life_up, 1, false);
		}
	}
}