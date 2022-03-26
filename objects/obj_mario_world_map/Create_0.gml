switch(global.currentStage) {
	case 1: {
		path_start(path_mario_world_map_1, 0.4, path_action_stop, true);
		break;
	}
	
	case 2: {
		path_start(path_mario_world_map_2, 0.5, path_action_stop, true);
		break;
	}
	
	case 3: {
		path_start(path_mario_world_map_3, 0.5, path_action_stop, true);
		break;
	}
}