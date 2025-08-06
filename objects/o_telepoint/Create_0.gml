/// @description Insert description here
// You can write your code in this editor
event_inherited();

function interaction(){
	o_player.occupied=true;
	var _prompt = instance_create_layer(x,y,"Instances",o_question_box);
	with (_prompt){
		header = "Would you like to teleport to your most recent savepoint?";
		text=["Teleport","Stay"];
		functions=[[teleport,o_player.recent_savepoint],[print,"coward."]];
	}
	
}