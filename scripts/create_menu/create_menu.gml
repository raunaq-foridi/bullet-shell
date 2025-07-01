//saves the format globally. easier than remembering indices
enum UI{
	TEXT,
	TYPE,
	CURRENT,
	RANGE,
	VARIABLE
}

//creates a list menu, such as a settings menu
function create_menu(_x,_y,_width,_height,_list,_sprite){
	if (is_undefined(_sprite)){_sprite=-1;}
	var _menu = instance_create_layer(_x,_y,"Instances",o_ui_list);
	with(_menu){
		width=_width;
		height=_height;
		sprite=_sprite;	//cranberry
		for(var _i = 0; _i<array_length(_list); _i++){
			ds_list_add(list,_list[_i]);
			
		}
		//create scrollbar
		
		//create_slider(x + _width, y, _height, 10, "","volume",cleanup_list,[0,max_scroll],"scrollbar");
	}
}

//function to format toggles, sliders etc properly alongside text
//Move this to o_ui_list eventually. need not be global.
function settings_item(_x,_y,_text,_type,_variable,_cleanup,_range=[0,1]){
	//_cleanup should be a ds_list. Destroy each object after a frame to prevent infinite objects!
	switch (_type){
		case "toggle":
			//draw_text(_x-_left_offset,_y,_text);
			create_toggle(_x,_y-25,5,5,"",_variable,_cleanup);
		break
		case "slider":
			//draw_text(_x-_left_offset,_y,_text);
			var _length= 40
			//create_slider(_x+_length-200,_y-25,_length,20,"",_variable);  //Valid when origin placed in corner
			create_slider(_x+80,_y+30, _length,20,"",_variable,_cleanup,_range);
		break
		case "list":
		//the _text parameter is used for the list of options here. multitasking :D
		//Multitasking is bad. Change this later.
			create_text_toggle(_x,_y,1,1,_text,_variable,_cleanup);
		break
	}
}


//some built in lists, for when being dynamic is unnecessary
//put common lists here, such as settings.

function list_name(_listname){
	//take in a string list name, output an array
	var _array = [];
	switch(_listname){

		case "settings":
		//list format is [text,type,current value,range,variable name]
		//for discrete variables, range is all possible values
		//for continuous ones like sliders, it is simply min and max.
		//variable name should be a string referring to a global variable.
			_array = [
			["mute","toggle",0,[0,1],"mute"],
			["volume","slider",100,[0,1],"volume"],
			["resolution","list","low",["low","medium","high"],"resolution"],
			["Text Speed","slider",1,[1,10],"text_speed"],
			//["volume2","slider",100,[0,200],"dummy"],
			//["","","",[],""]	//dummy entry. Required to fix stuff.
			]
			
			//Current issue: Each slider requires its own dummy entry at the end to function.
			//long day. Not sustainable in its current form.
			//Solved: Add a new dummy entry for each slider.
		break
		
	}
	for(var _i=0; _i<array_length(_array); _i++){
		if (_array[_i][1]=="slider"){
			array_push(_array,["","","",[],""]);
		}
	}
	return _array
}