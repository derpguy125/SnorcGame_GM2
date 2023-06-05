// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wrap_angle(_angle){
	while _angle < 0.0		_angle += 360;
	while _angle >= 360.0	_angle -= 360;
	
	return _angle;
}