canEnter = true;

for(var i = 0; i < array_length(global.warpsEntered); i++) {
	if(global.warpsEntered[i] == warp_id) {
		canEnter = false;
	}
}