/// @description An alternate version of signs, that uses object parenting
event_inherited();

name = "";
function interaction(){
	var _dialogue = instance_create_layer(x,y,layer,o_dialogue_box);
	with(_dialogue){
		if(typeof(other.text)=="string"){other.text=[other.text];}
		text = other.text;
		name = other.name;
		text_delay = other.text_delay;
		voice = other.voice;
	}	
	
}