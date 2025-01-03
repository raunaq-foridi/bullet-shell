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
			["volume","slider",100,[0,100],"volume"],
			["resolution","list","low",["low","medium","high"],"resolution"]
			]
		break
		
	}
	return _array
}