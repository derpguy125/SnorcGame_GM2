function player_normal(){
	// restart!!
	
	// moving the player
	
	// jumping
	
	if keyboard_check_pressed(ord("Z")) && ground {
		gsp = 0;
		
		hsp -= jmp * sin(degtorad(angle));
		vsp -= jmp * cos(degtorad(angle));
	}
	
	var _move = keyboard_check(vk_right) - keyboard_check(vk_left);
	
	if _move < 0 then {
		if gsp > 0 then {						// if moving right
			gsp -= dcc;							// decellerate
			if gsp <= 0 gsp = -0.5;				// emulate a quirk
		} else if gsp > -top {					// if moving left
			gsp -= acc;							// accelerate
			if gsp <= -top gsp = -top;			// impose top speed limit
		}
	} else if _move > 0 then {
		if gsp < 0 then {						// if moving left
			gsp += dcc;							// decellerate
			if gsp >= 0 gsp = 0.5;				// emulate a quirk
		} else if gsp < top {					// if moving right
			gsp += acc;							// accelerate
			if gsp >= top gsp = top;			// impose top speed limit
		}
	} else {
		gsp -= min(abs(gsp),frc) * sign(gsp)	// decelerate	
	}
	
	hsp = gsp;
	
	
	
	if !ground then {
		state = states.air;	
	}
}