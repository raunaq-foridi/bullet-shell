/// @description Insert description here
// You can write your code in this editor
if (hovering){
	if(listening){image_index=KEYBINDER_SPRITES.LISTENING;}
	else{image_index=KEYBINDER_SPRITES.HOVERED;}
}
else{image_index=KEYBINDER_SPRITES.OFF;}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(not array_contains(exceptions,assigned_key)){
	//print("assigned as",assigned_key,keyboard_lastchar,keyboard_lastkey);
	draw_text(x,y,string_upper(key_name));	
}
else{
	var _name = "";
	switch (assigned_key){
		
		case vk_enter:
			_name = "enter";
		break
		
		case vk_space:
			_name = "space";
		break
		
		case vk_shift:
			_name = "shift";
		break
		
		case vk_tab:
			_name = "tab";
		break
		
		case vk_lcontrol:
			_name = "Ctrl (L)";
		break
		case vk_rcontrol:
			_name = "Ctrl (R)";
		break
		case vk_control:
			_name = "ctrl";
			print("I AM THE CONTROLLER");
		break
		
		case vk_alt:
			_name = "alt";
		break
		
		case vk_escape:
			_name = "esc";
		break
		
		case vk_up:
			_name = "UpArrow";
		break
		
		case vk_down:
			_name = "DownArrow";
		break
		
		case vk_left:
			_name = "LeftArrow";
		break
		
		case vk_right:
			_name = "RightArrow";
		break
		
		case 20:
			_name = "Caps";
		break
		
		case vk_delete:
			_name = "Del";
		break
		
		default:
			_name = "Unknown";
		break
		
	}
	//
	draw_text(x,y,_name);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

