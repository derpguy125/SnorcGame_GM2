/// @description camera thingies uhh yeah
// You can write your code in this editor

xx = round(obj_player.x);
yy = round(obj_player.y);

xx = clamp(xx - (camW/2),0,room_width  - camW);
yy = clamp(yy - (camH/2),0,room_height - camH);