// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouse_in_box(_x1,_y1,_width,_height){
	if (window_mouse_get_x()>_x1 and window_mouse_get_x()<_x1+_width
	and window_mouse_get_y()>_y1 and window_mouse_get_y()<_y1+_height){return true}
	else{return false}
}