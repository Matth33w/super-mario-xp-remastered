initialYPosition = y;
maxYPosition = y - 31;

piranhaTimeout = 2;

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

if(!reverse)
	piranhaDirection = 1;
else
	piranhaDirection = -1;