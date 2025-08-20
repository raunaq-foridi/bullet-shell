/// @description Insert description here
// You can write your code in this editor
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
//print("keypos",o_keyboard_controller.keyboard_pos);
if(not is_array(keyboard_pos)){
	exit}
if (array_equals(o_keyboard_controller.keyboard_pos,keyboard_pos)
	or position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
		hovering=true;}
else{hovering = false;}
if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){mouse_hover=true;}
else{mouse_hover=false};
if(hovering){
	image_index=1;
	if ((mouse_check_button_pressed(mb_any) and mouse_hover) or input_check_pressed("select")){clicked=true;}
	if (clicked){
		image_index=2;
		if (mouse_check_button_released(mb_any) or input_check_pressed("select")){script_execute_ext(script,arguments);}
	}
}
else{
	image_index=0;
}