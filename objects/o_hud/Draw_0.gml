/// @description Parallax and Camera

//Deals with Camera

//camera_set_view_pos(view_camera[0],o_player.x,o_player.y);


var _x = clamp(o_player.x - camera_width/2,0,room_width -camera_width);
var _y = clamp(o_player.y - camera_height/2,0,room_height -camera_height); //Stop the camera exiting the rooms borders

var _cam_x = camera_get_view_x(view_camera[0]);		//grab camera co-ords
var _cam_y = camera_get_view_y(view_camera[0]);

var _h_border = camera_width/2 - horizontal_border;	//_h_border represents how far from the camera's centre the border is
var _v_border = camera_height/2 - vertical_border;	//likewise

//Move Camera, once player outside of borders
//X direction
if (_x-_cam_x>=_h_border){
	camera_set_view_pos(view_camera[0],lerp(_x-_h_border,_cam_x,camera_speed),_cam_y);
}
else if(_cam_x-_x>=_h_border){
	camera_set_view_pos(view_camera[0],lerp(_x+_h_border,_cam_x,camera_speed),_cam_y);
}
//Y direction
_cam_x = camera_get_view_x(view_camera[0]);
_cam_y = camera_get_view_y(view_camera[0]);

if (_y-_cam_y>=_v_border){
	camera_set_view_pos(view_camera[0],_cam_x,lerp(_y-_v_border,_cam_y,camera_speed));
}
else if(_cam_y-_y>=_v_border){
	camera_set_view_pos(view_camera[0],_cam_x,lerp(_y+_v_border,_cam_y,camera_speed));
}


//Deals with Parallax

_cam_x = camera_get_view_x(view_camera[0]);		//grab camera co-ords
_cam_y = camera_get_view_y(view_camera[0]);
layer_x("Background",_cam_x*0.9);
layer_y("Background",_cam_y);
layer_x("Background_2",_cam_x*0.7);
layer_y("Background_2",_cam_y+300);