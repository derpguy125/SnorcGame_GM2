function get_ground_collision() {
	var _sAX, _sAY, _sBX, _sBY;
	
	if mode = 0 then {
		_sAX = round(x) - wRad;
		_sBX = round(x) + wRad;
		_sAY = round(y) + hRad;
		_sBY = round(y) + hRad;
	}
	
	_sAY -= 12;
	_sBY -= 12;
	
	var _sAFound = false, _sBFound = false;
	
	var	_tries = 24;
	
	while _tries > 0 {
		_sAY ++;
		_tries --;
		if position_meeting(_sAX, _sAY, obj_solid) or position_meeting(_sAX, _sAY, obj_platform) then {
			_sAFound = true;
			break;
		}
	}
	
		_tries = 32;
	
	while _tries > 0 {
		_sBY ++;
		_tries --;
		if position_meeting(_sBX, _sBY, obj_solid) or position_meeting(_sBX, _sBY, obj_platform) then {
			_sBFound = true;
			break;
		}
	}
	
	if !_sAFound && !_sBFound then {
		y = round(y);
		ground = false;
	} else {
		y = min(_sAY, _sBY) - hRad;
		vsp = 0;
		ground = true;
	}
}

function collision() {
	// some new collision shit
	
	var _dir = 0;
	
	get_ground_collision();
	
	move_player();
}

function move_player() {
	x += hsp;
	y += vsp;
}