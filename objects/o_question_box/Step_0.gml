/// @description Keyboard Controls

//Select
if (keyboard_check_pressed(global.keys.select)){
	
	alarm[0]=1;
}

//Up

if (keyboard_check_pressed(global.keys.move_up)){
	
	selection-=1;
	selection%=array_length(text);
	if(selection<0){
		selection += array_length(text)
	}
}

//Down

if (keyboard_check_pressed(global.keys.move_down)){
	selection+=1;
	selection%=array_length(text);
}