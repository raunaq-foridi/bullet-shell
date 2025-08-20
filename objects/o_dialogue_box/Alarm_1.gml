/// @description 1 frame delay on forwarding

var _text_delay = text_delay/global.text_speed;
if (letter_pos<string_length(text[dialogue])*_text_delay){
	letter_pos=floor(string_length(text[dialogue])*_text_delay+1);
}
else{
	dialogue+=1;
	letter_pos=0;
}
if (dialogue>=array_length(text)){
	//print("WHAT");
	//o_player.occupied=false;
	for (var _i=0; _i<array_length(end_functions); _i++){
		var _func_array = end_functions[_i]
		var _func = array_shift(_func_array);
		
		script_execute_ext(_func,_func_array);
		//print(_func_array);
		
	}
	//script_execute_ext(end_function[0],end_function[1]);
	instance_destroy();
}