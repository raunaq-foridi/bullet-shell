/// @description Insert description here
// You can write your code in this editor
//print(global.dialogue_text_size);
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
	instance_destroy();
}