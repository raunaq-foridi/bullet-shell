/// @description Insert description here
// You can write your code in this editor

//o_slider_bar.x = clamp(window_mouse_get_x();
print("Attempting to move bar!");
with(bar){
	if(grabbing){
		x = clamp(window_mouse_get_x(),empty_x,full_x);
	}
}