/// @description placeholder please add description

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