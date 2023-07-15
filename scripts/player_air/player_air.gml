// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_air(){
	var _move = keyboard_check(vk_right) - keyboard_check(vk_left);
	
	if _move == 1 then
		if hsp < top then hsp += airAcc;
		
	if _move == -1 then
		if hsp > -top then hsp -= airAcc;
	
	if vsp < 0 && vsp > -4
		hsp -= floor(hsp / 0.125) / 256;
	
	if vsp < 16 then vsp += grv;
	
	if ground then state = states.normal;
}