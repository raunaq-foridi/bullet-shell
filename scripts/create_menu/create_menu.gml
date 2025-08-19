//saves the format globally. easier than remembering indices
enum UI{
	TEXT,
	TYPE,
	CURRENT,
	RANGE,
	VARIABLE,
	KEY_POS
}

//creates a list menu, such as a settings menu
function create_menu(_x,_y,_width,_height,_list,_sprite,_other_lists=[],_name=""){
	if (is_undefined(_sprite)){_sprite=-1;}
	var _menu = instance_create_layer(_x,_y,"Instances",o_ui_list);
	with(_menu){
		width=_width;
		height=_height;
		sprite=_sprite;	//cranberry
		other_lists=_other_lists;		//what other tabs can be accessed
		name = _name;					//what tab is this? If no other lists, this is unnecessary
		for(var _i = 0; _i<array_length(_list); _i++){
			ds_list_add(list,_list[_i]);
			
		}
		//ds_grid_resize(o_keyboard_controller.keyboard_grid,1,ds_list_size(list));
		//create scrollbar
		
		//create_slider(x + _width, y, _height, 10, "","volume",cleanup_list,[0,max_scroll],"scrollbar");
	}
}

//function to format toggles, sliders etc properly alongside text
//Move this to o_ui_list eventually. need not be global.
function settings_item(_x,_y,_text,_type,_variable,_cleanup,_keypos,_range=[0,1]){
	//_cleanup should be a ds_list. Destroy each object after a frame to prevent infinite objects!
	switch (_type){
		case "toggle":
			//draw_text(_x-_left_offset,_y,_text);
			create_toggle(_x,_y-25,5,5,"",_variable,_cleanup,_keypos);
		break
		case "slider":
			//draw_text(_x-_left_offset,_y,_text);
			var _length= 40
			//create_slider(_x+_length-200,_y-25,_length,20,"",_variable);  //Valid when origin placed in corner
			create_slider(_x+80,_y+30, _length,20,"",_variable,_cleanup,_keypos,_range);
		break
		case "list":
		//the _text parameter is used for the list of options here. multitasking :D
		//Multitasking is bad. Change this later.
			create_text_toggle(_x,_y,1,1,_text,_variable,_cleanup,_keypos);
		break
		case "keybind":
		//Use _variable to choose which input it assigns
			create_keybinder(_x,_y,1,1,_variable,_cleanup,_keypos);
		break
		case "button":
			//use _variable for the function, and _range for any parameters/arguments
			create_button(_x,_y,1,1,_text,_variable,_range,_keypos,true,_cleanup);
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
		//list format is [text,type,current value,range,variable name, key_pos]
		//for discrete variables, range is all possible values
		//for continuous ones like sliders, it is simply min and max.
		//variable name should be a string referring to a global variable.
		//key_pos is a 2 integer array of where on the "grid" the toggle is located
			_array = [
			["mute","toggle",0,[0,1],"mute",[0,1]],
			["volume","slider",100,[0,1],"volume",[0,2]],
			["resolution","list","low",["low","medium","high"],"resolution",[0,3]],
			["map transparency","toggle",0,[0,1],"map_transparency",[0,4]]
			//["volume2","slider",100,[0,200],"dummy"],
			//["","","",[],""]	//dummy entry. Required to fix stuff.
			]
			
			//Current issue: Each slider requires its own dummy entry at the end to function.
			//long day. Not sustainable in its current form.
			//Solved: Add a new dummy entry for each slider.
		break
		case "text_settings":
		//list format is [text,type,current value,range,variable name, key_pos]
		//for discrete variables, range is all possible values
		//for continuous ones like sliders, it is simply min and max.
		//variable name should be a string referring to a global variable.
			_array = [
			["Text Speed","slider",1,[1,10],"text_speed",[0,1]],
			["Text Size","slider",1,[1,3],"dialogue_text_size",[0,2]]
			//["volume2","slider",100,[0,200],"dummy"],
			//["","","",[],""]	//dummy entry. Required to fix stuff.
			]
			
			//Current issue: Each slider requires its own dummy entry at the end to function.
			//long day. Not sustainable in its current form.
			//Solved: Add a new dummy entry for each slider.
		break
		case "keybinds":
		//settings_item(_x+width-padding,_y+item_height/2,_range,_type,_variable,cleanup_list,_key_pos,_range);
		//_x,_y,_text,_type,_variable,_cleanup,_keypos,_range=[0,1]
		//This is the way items are created
		//list format is [text,type,current value,range,variable name, key_pos]
		//Hence, keybind format is [Text, "keybind", 0, 0, "assignment", [key,pos]  ]
			_array = [
			["Test Keybind Up","keybind",0, 0, "move_up", [0,1]],
			["Test Keybind Down","keybind",0, 0, "move_down", [0,2]],
			["Set Keybinds","button",0,[],set_keybinds,[0,3]]
			]
		
	}
	for(var _i=0; _i<array_length(_array); _i++){
		if (_array[_i][1]=="slider"){
			//FOR FUTURE: If list format is changed, make sure to modify accordingly!
			array_push(_array,["","","",[],"",[]]);
		}
	}
	return _array
}