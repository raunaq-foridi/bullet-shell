/// @description Keyboard Controls

//Select
if (input_check_pressed("select")){
	
	alarm[0]=1;
}

//Up

if (input_check_pressed("menu_up")){
	
	selection-=1;
	selection%=array_length(text);
	if(selection<0){
		selection += array_length(text)
	}
}

//Down

if (input_check_pressed("menu_down")){
	selection+=1;
	selection%=array_length(text);
}