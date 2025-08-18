/// @description Insert description here
// You can write your code in this editor

assigned =false;

assigned_key = -1;
key_name = ""

depth=-100;
width=10;		//unused
height=10;
text="";
controlled_input = ""	;	//Should be a string, such as "move_up" for whichever input this controls



clicked=false;
keyboard_pos=0;		//should be array. Using 0, an invalid value, to prevent code running if not properly set 

hovering=false;

listening=false;


//No.
key_index = {
	A : 1,
	B : 2,
	C : 3,
	
}

enum KEYBINDER_SPRITES{
	
	OFF,
	HOVERED,
	LISTENING
}

exceptions =[vk_alt,vk_backspace,vk_control,vk_delete,vk_tab,vk_space,vk_shift,vk_left,vk_right,vk_up,vk_down]