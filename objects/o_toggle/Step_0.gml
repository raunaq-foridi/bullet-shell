/// @description Insert description here
// You can write your code in this editor
//print(0);
//hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

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
	//image_index=SPRITES.OFF_HOVERED;
	if ((mouse_check_button_pressed(mb_any) and mouse_hover) or input_check_pressed("select")){clicked=true;}
	if (clicked){
		//image_index=SPRITES.ON_HOVERED;
		if (mouse_check_button_released(mb_any) or input_check_released("select")){
			//script_execute_ext(script,arguments);
			state =!state;
			variable_global_set(toggle,state);
		}
	}
}
else{
	//image_index=SPRITES.OFF;
}

state = variable_global_get(toggle);

