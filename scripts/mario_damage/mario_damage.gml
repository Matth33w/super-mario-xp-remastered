// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mario_damage(damageValue){
	obj_player.hitState = true;
	global.pHealth -= damageValue;
	audio_play_sound(snd_mario_damage_1, 1, false);
}