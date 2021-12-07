if(!instance_exists(obj_player_sprite)) {
	instance_create_layer(x, y, "Objects", obj_player_sprite);
}

horizontalSpeed = 3;
pGravity = 1;

currentX = 0;
currentY = 0;

platformHorizontalEffector = 0;
platformVerticalEffector = 0;

steppingOnPlatform = false;

xMax = 1.6;
yMax = 8;

hitState = false;
hitTimeout = 0;

blockHit = false;

invincibilityState = false;
invincibilityTimeout = 0;

playerDead = false;
canMove = true;

warpState = false;
warpDirection = "none";
warpYLimit = 0;
warpChangeScreen = false;

attacking = false;
itemCrash = false;

itemCrashTimeout = 0;
itemCrashThrow = 0;

itemCrashCrossSFX = false;

lastHorizontalDirection = initial_horizontal_direction;

enemyBounce = 0;

if(global.initialWarping) {
	if(global.startX != -1 && global.startY != -1) {
		obj_player.x = global.startX;
		obj_player.y = global.startY;
	}
	
	obj_player.canMove = false;
	obj_player.warpState = true;
	obj_player.currentY = 0;
	obj_player.warpDirection = global.initialWarpDirection;
	audio_play_sound(snd_warp_pipe, 1, false);
	
	switch(global.initialWarpDirection) {
		case "down": {
			obj_player.warpChangeScreen = false;
			obj_player_sprite.sprite_index = spr_mario_jumping;
			obj_player.warpYLimit = obj_player.y + 32;
			global.screenToWarp = noone;
			global.initialWarping = true;
			global.startX = -1;
			global.startY = -1;
			break;
		}
		
		case "up": {
			obj_player.warpChangeScreen = false;
			obj_player_sprite.sprite_index = spr_mario_crouch;
			obj_player.warpYLimit = obj_player.y - 32;
			global.screenToWarp = noone;
			global.initialWarping = true;
			global.startX = -1;
			global.startY = -1;
			break;
		}
	}
}