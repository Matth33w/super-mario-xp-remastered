initialYPosition = y;
maxYPosition = y - 31;

piranhaDirection = 1;
piranhaTimeout = 1.5;

dead = false;

switch(piranha_type) {
	case "green": {
		piranhaSpeed = 0.5;
		break;
	}
	
	case "red": {
		piranhaSpeed = 2;
		break;
	}
}