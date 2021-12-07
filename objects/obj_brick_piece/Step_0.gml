ySpeed += 0.2;

x += xSpeed;
y += ySpeed;

image_angle -= 15;

if(y > room_height + sprite_height) {
	instance_destroy();
}

if(secret_brick)
	sprite_index = spr_brick_piece_2;