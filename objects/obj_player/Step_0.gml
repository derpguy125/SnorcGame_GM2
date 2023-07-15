/// @description placeholder please add description

if ground then angle = get_slope_angles();

switch state {
	case states.normal:
		player_normal();
		break;
	case states.air:
		player_air();
		break;
	case states.roll:
		player_roll();
		break;
}

collision();