/// @description i dont fucking know uhhh bones???

switch sprite_index {
	case spr_player_rollball:
		angle = 0;
		break;
	
	default:
		if ground {
			angle = get_slope_angles();
		} else angle = 0;
}