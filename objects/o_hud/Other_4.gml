/// @description Insert description here
// You can write your code in this editor
var _camera_width = camera_get_view_width(view_camera[0]);
var _camera_height = camera_get_view_height(view_camera[0]);
var _x = o_player.x-_camera_width/2;
if (_x<0){_x=0;}
camera_set_view_pos(view_camera[0],_x,o_player.y-_camera_height/2);
var _cam_x = camera_get_view_x(view_camera[0]);		//grab camera co-ords
var _cam_y = camera_get_view_y(view_camera[0]);
layer_x("Background",_cam_x*0.9);
layer_y("Background",_cam_y);
layer_x("Background_2",_cam_x*0.2);
layer_y("Background_2",_cam_y+300);