if(!instance_exists(obj_player_sprite)) {
	instance_create_layer(x, y, "Objects", obj_player_sprite);
}

horizontalSpeed = 1.6;
pGravity = 1;

currentX = 0;
currentY = 0;

xMax = 1.6;
yMax = 8;

hitState = false;
hitTimeout = 0;

blockHit = false;

invincibilityState = false;
invincibilityTimeout = 0;

playerDead = false;
canMove = true;

attacking = false;

lastHorizontalDirection = 1;