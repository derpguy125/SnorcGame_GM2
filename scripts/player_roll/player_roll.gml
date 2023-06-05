// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_roll(){
	msp -= 0.125;
	
	if (msp <= 0 or hsp = 0) and !place_meeting(x,y+1,obj_slope) then {
		if !solids(x,y-1) then {
			state = states.normal;
			mask_index = spr_player_mask;
		} else {
			msp = 4;
			if hsp = 0 then dir = -dir;
		}
	} else if place_meeting(x,y+1,obj_slope) and msp <= 0 {
		msp = 3;
		dir = -dir;
	}
	
	hsp = msp * dir;
}