function solids(xx, yy) {
	// Code shamefully stolen- er I mean reinterpreted from code found in Pizza Tower
	// McPig pls dont hurt me
	
	var oldX, oldY;
	oldX = x; oldY = y;
	x = xx; y = yy;
	
	// Solid Collision
	
	if place_meeting(x,y,obj_solid) {
		x = oldX;
		y = oldY;
		return 1;
	}
	
	// Plataform Collision
	
	if y > oldY and (bbox_bottom % 16) == 0 and 
	!place_meeting(x,oldY,obj_platform) and place_meeting(x,y,obj_platform) {
		x = oldX;
		y = oldY;
		return 1;
	}
	
	// Slope Collisions
	
	var slope = instance_place(x,y,obj_slope);
	
	if slope then with slope {
		var obj_side, slope_start, slope_end = 0;
		if image_xscale > 0 {
			obj_side = other.bbox_right;
			slope_start = bbox_bottom;
			slope_end = bbox_top;
		} else {
			obj_side = other.bbox_left;
			slope_start = bbox_top;
			slope_end = bbox_bottom;
		}
		
		var m = ((sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left));
		slope = (slope_start - round((m * (obj_side - bbox_left))));
		if other.bbox_bottom >= slope {
			other.x = oldX;
			other.y = oldY;
			return 1;
		}
	}
	
	// no collision
	
	x = oldX;
	y = oldY;
	return 0;
}

function collision_thing() {
	// code also shamelessly "rewritten" from code found in a pizza tower decomp namely the xmas break one
	ground = false;
	
	// vertical collisions
	repeat abs(vsp) {
		if !solids(x, y+sign(vsp))
			y += sign(vsp);
		else {
			vsp = 0;
			break;
		}
	}
	
	// horizont me daddy
	repeat abs(hsp) {
		// slonp up
		if solids(x + sign(hsp), y) && !solids(x + sign(hsp), y - 1)
			y --;
			
		// slonp down's
		if !solids(x + sign(hsp), y) && !solids(x + sign(hsp), y + 1) && solids(x + sign(hsp), y + 2)
			y ++;
			
		// actual collisions
		if !solids(x + sign(hsp), y)
			x += sign(hsp);
		else {
			hsp = 0;
			break;
		}
	}
	
	// gravity and groundination
	
	if vsp < 20 then vsp += grv;
	
	ground |= solids(x, y+1);
	ground |= ((!(place_meeting(x,y,obj_platform))) && place_meeting(x,y+1,obj_platform));
	
}

