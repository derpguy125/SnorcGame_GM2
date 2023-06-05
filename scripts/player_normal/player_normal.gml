function player_normal(){
	var move = keyboard_check(vk_right) - keyboard_check(vk_left);
	
	if move != 0 then {
		if dir != move then {
			msp -= 0.5;
			if msp <= 0 then {
				msp = 0;
				dir = move;
			}
		} else {
			if msp < 16 msp += 0.25;
		}
	}
	else {
		msp -= 0.25;
		if msp <= 0 then msp = 0;
	}
	
	if place_meeting(x + dir, y, obj_solid) {
		msp = 0;
	}
	
	hsp = dir * msp;
	
	if ground {
		xscale = dir;
		sprite_index = spr_player_idling;
		varJump = false;
		if keyboard_check_pressed(ord("Z")) {
			vsp = -7.5;
			sprite_index = spr_player_rollball;
		}
		
		if keyboard_check(vk_down) && msp > 4 then {
			sprite_index = spr_player_rollball;
			image_index = 0;
			mask_index = spr_player_masksmalls;
			state = states.roll;
		}
	} else {
		if keyboard_check_released(ord("Z")) && !varJump {
			vsp /= 2;
			varJump = true;
		}
	}
}