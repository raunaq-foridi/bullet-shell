/// @description Insert description here
// You can write your code in this editor

//All relevant variables should be changed upon creation by the object that creates it

text = ["Placeholder Text AAAAAAAAAAAAAaaaaaaaaa aaaaaaaAAAAAaa a aa aaaaaaaaa aaa aaaaaaaaaa aaa aaaaa aaaa aaa aaaaa",
		"Here is a second line of test dialogue"];
text_speed=1;
text_delay=10;		//Makes *this* dialogue box slower. Divided by global text speed
text_size=1;
dialogue = 0;		//Text will later be made into a list, that goes through upon pressing enter. this tracks which index to use.
scale = 2;

end_function = [print,["dialogue done"]];	//function and parameter(s) to run after dialogue completes

letter_mode = true;
letter_pos=0;		//for letter-by-letter typing; what letter is it on?
text_padding = 20;

sprite = -1;
talk_sprite = -1;	//kinda assumes Undertale style talksprite usage. Might not go for that.
name="";
name_sprite =-1;	

voice = snd_type;	//sound effect used for vocal blips
voice_variation = 0.2;

x=100;
y=window_get_height()-300;

width = window_get_width() -2*x;
height = 200;
o_player.occupied=true;

continuing_dialogue=false;