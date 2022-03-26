entityDirection = 1;
entitySpeed = 0.5;

currentX = 0;
currentY = 0;

dead = false;
defeated = false;
deadTimeout = 0;

defeatedYSpeed = -4.5;

shellMoving = false;
shellDirection = 0;

onCamera = false;

increase = true;

if(type == "green")
	sprite_index = spr_paratroopa_green;
else if(type == "red")
	sprite_index = spr_paratroopa_red;