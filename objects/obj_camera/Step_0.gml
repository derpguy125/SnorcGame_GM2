/// @description camera thingies uhh yeah
// You can write your code in this editor

xx = round(obj_player.x);
yy = round(obj_player.y);

xx = clamp(xx - (960/2),0,room_width  - 960);
yy = clamp(yy - (540/2),0,room_height - 540);