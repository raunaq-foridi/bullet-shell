/// @description An object to save through. will later bring up a menu

event_inherited();
//purely for oscillatory effect
start_x=x;
start_y=y;
bounce_range=20;
timer=0;

function interaction(){
	//save();	//This will later instead open a menu, and that menu will allow you to save
	
	//Create Question box for saving
	var _save_question = instance_create_layer(x,y,layer,o_question_box);
	with(_save_question){
		header="Save to which slot?";
		text=["Save slot 1","Save slot 2","Save slot 3","cancel"];
		functions=[[save,1],[save,2],[save,3],[print,"cancelled saving"]];
	}
}