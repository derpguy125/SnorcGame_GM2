// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_air(){
	var _move = keyboard_check(vk_right) - keyboard_check(vk_left);
	
	if _move == 1 then
		if gsp < top then gsp += airAcc;
		
	if _move == -1 then
		if gsp > -top then gsp -= airAcc;
	
	if vsp < 0 && vsp > -4
		gsp -= floor(gsp / 0.125) / 256;
		
	hsp = gsp;
	
	if vsp < 16 then vsp += grv;
	
	angle = 0;
	
	if ground then state = states.normal;
}