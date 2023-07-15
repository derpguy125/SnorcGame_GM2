// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_slope_angles(){
	var angular = 0;
	var xx1, xx2, yy1, yy2;
	xx1 = x - 4;
	xx2 = x + 4;
	yy1 = y;
	yy2 = y;
	
	repeat(25) {
		if !solids(floor(xx1), floor(yy1)) {
			yy1 ++;
		}
		if !solids(floor(xx2), floor(yy2)) {
			yy2 ++;
		}
	}
	
	if yy1 >= y + 25 or yy2 >= y + 25 then return 0;
	
	angular = floor(point_direction(xx1*2,yy1*2,xx2*2,yy2*2));
	return angular;
}