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
	!place_meeting(x,oldY,obj_platform) and place_meeting(x,y,obj_platform) and vsp > 0 {
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

function collision() {
	// code rewritten from my other game SRB2C
	ground = false;
	
	// horizontal collisions
	if solids(x+hsp,y) {
		// move up slope
		var yplus = 0;
		while (solids(x+hsp,y-yplus) && yplus <= abs(hsp)) yplus += 1;
		
		//actually do the collisions
		if solids(x+hsp,y-yplus) {
			while !solids(x+sign(hsp),y) x += sign(hsp);	
			hsp = 0;
		} else y -= yplus;
	}
	x += hsp;
	
	// move down slope
	if !solids(x,y) && vsp >= 0 && solids(x,y+2+abs(hsp)) {
		while !solids(x,y+1) y ++;	
	}
	
	// vertical collisions
	if solids(x,y+vsp) {
		while !solids(x,y+sign(vsp))
			y += sign(vsp);
		vsp = 0;
	}
	y += vsp;
	
	// one way solid collision
	
	if place_meeting(x,y+1,obj_platform) && vsp > 0 {
		var wall = instance_place(x,y+1,obj_platform);
		if vsp > 0 {
			if bbox_bottom > wall.bbox_top && (bbox_top < wall.bbox_top - ((bbox_bottom - bbox_top) - (abs(vsp) + 1))) {
				vsp = 0;
				y += wall.bbox_top - bbox_bottom;
			}
		}
	}
	
	// gravity and groundination
	
	if vsp < 16 then vsp += grv;
	
	ground |= solids(x, y+1);
	ground |= ((!(place_meeting(x,y,obj_platform))) && place_meeting(x,y+1,obj_platform));
	
}