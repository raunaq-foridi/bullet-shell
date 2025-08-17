/// @description Insert description here
// You can write your code in this editor
var _text_delay = text_delay/global.text_speed;
scale = global.dialogue_text_size;
if (letter_pos<string_length(text[dialogue])*_text_delay+1){
	letter_pos+=1;						
	if (floor(letter_pos/_text_delay)>floor((letter_pos-1)/_text_delay)){
		if(alarm[0]<=0){
			audio_play_sound(voice,1,false,1,0,random_range(1-voice_variation,1+voice_variation));	//play typing sound effect	
			alarm[0]=5;
		}
	}
}

if(keyboard_check_pressed(global.keys.select)){
		
	alarm[1]=1;
}