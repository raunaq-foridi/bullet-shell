/// @description Insert description here
// You can write your code in this editor
if(within_range){
	if(o_player.interactions[0]==id and not o_player.occupied){
		//print(text);
		var _dialogue = instance_create_layer(x,y,"Instances",o_dialogue_box);
		with(_dialogue){
			if(typeof(other.text)=="string"){other.text=[other.text];}
			text = other.text;
			name = other.name;
			text_delay = other.text_delay;
		}
	}
}