instanceDirection = -1;
depth = 30;

audio_sound_gain(bgm_boss_loop_remaster, 1, 0);

onGround = true;

onGroundTimeout = 0;
moveTimeout = 0;
fallTimeout = 0;
moveSpeedTimeout = 0;

rising = false;
risingSpeed = 0;

fallSpeed = 0;

falling = false;
moving = false;

movingSpeed = 2;

additionalY = 0;
lastY = 0;

goombaLaunchTimer = 0;
currentAnim = "idle";
animationTimeout = 0;

damagePoints = 16;

active = true;

defeatedTimeout = 0;
defeatedMusic = false;