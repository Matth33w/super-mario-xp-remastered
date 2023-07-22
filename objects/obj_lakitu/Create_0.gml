entityDirection = -1;
entitySpeed = 0.5;

currentX = 0;
currentY = 0;

dead = false;
defeated = false;
deadTimeout = 0;

defeatedYSpeed = -5.2;

jumped = false;
jumpTimeout = 0;

jumpStrength = 0;

hammerThrown = false;

aimDirection = -1;

initialX = x;

yPoint = -24;
yPointMax = 56;

screenLimit = (room != stage_3_2) ? 16 : 56;

y = camera_get_view_y(view_camera[0]) - 24;