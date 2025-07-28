/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

//All relevant variables should be changed upon creation by the object that creates it

header = "Insert Question Here"
text = ["Option 1",
		"The Second Option"];
		
selection = 0; //which of the options is currently highlighted?
//The functions that are run upon selection, in the format [Function, argument1, arg2...]
functions =[[print,"aa"],
			[print, "bb"]];


scale = 2;

letter_mode = true;	//for now, unused.
letter_pos=0;		//for letter-by-letter typing; what letter is it on?
text_padding = 20;

sprite = -1;

x=100;
y=window_get_height()-300;

width = window_get_width() -2*x;
height = 200;
o_player.occupied=true;
continuing_dialogue=false;