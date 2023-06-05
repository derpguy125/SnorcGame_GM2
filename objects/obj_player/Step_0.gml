/// @description step event make player do thing

// test cjaracter movement's
switch state {
	case states.normal:
	default:
		player_normal();
		break;
		
	case states.roll:
		player_roll();
		break;
}

// collide me daddy
collision_player();