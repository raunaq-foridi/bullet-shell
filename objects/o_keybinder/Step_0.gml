/// @description Insert description here
// You can write your code in this editor
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
//print("keypos",o_keyboard_controller.keyboard_pos);
//print(controlled_input,keyboard_pos);
if(not is_array(keyboard_pos)){
	exit}
if (array_equals(o_keyboard_controller.keyboard_pos,keyboard_pos)
	or position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
		//print("hover at",keyboard_pos);
		hovering=true;}
else{hovering = false;
	//print("unhover at", keyboard_pos);
	}
//print(array_equals(o_keyboard_controller.keyboard_pos,keyboard_pos),"keyboarding");
if(hovering){
	if (mouse_check_button_pressed(mb_any) or (keyboard_check_pressed(global.keys.select) and not listening)){
		clicked=true;
		print("Clack");
	}
	if (clicked and not listening){
		if (mouse_check_button_released(mb_any) or keyboard_check_released(global.keys.select)){
			
			//Begin to listen for keyboard input
			listening=true;
			//o_keybinder.clicked=false;
			alarm[0] = 300;	//stop listening after 5 seconds
			
		}
	}
}

//Actually Listen for input
if (listening){
	clicked=false;
	o_pause.enabled = false;
	o_keyboard_controller.enabled = false;
	//o_keyboard_controller.keyboard_pos=variable_clone(keyboard_pos);	//inefficient but (non??) functional.
	
	if (keyboard_check_pressed(vk_anykey)){
		assigned_key=keyboard_key;
		key_name = keyboard_lastchar;
		hovering=false;
		listening=false;
		print(keyboard_lastchar);
		alarm[0]=1;
		//o_pause.enabled=true;
		//o_keyboard_controller.enabled = true;
	}
}