/// @description Parallax

//Deals with Parallax

var _cam_x = camera_get_view_x(view_camera[0]);
layer_x("Background",_cam_x*0.9);
layer_x("Background_2",_cam_x*0.7);