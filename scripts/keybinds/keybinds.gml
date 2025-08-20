keys = {
	move_left : ord("A"),	
	move_right: ord("D"),
	move_up   : ord("W"),
	move_down : ord("S"),
	jump	  : vk_space,
	
	select	  : vk_enter,
	
	camera_left:	vk_left,
	camera_right:	vk_right,
	camera_up:		vk_up,
	camera_down:	vk_down,
	
	menu_up:	vk_up,
	menu_down:	vk_down,
	
	mouse_attack: false,
	attack:		ord("L"),	//idk man. get Adam to choose more wisely
	
	inventory:	ord("E"),
	map:		ord("M"),
	pause_key:	ord("P")
}

default_keyboard_mouse = {
	move_left : ord("A"),	
	move_right: ord("D"),
	move_up   : ord("W"),
	move_down : ord("S"),
	jump	  : vk_space,
	
	select	  : vk_enter,
	
	camera_left:	vk_left,
	camera_right:	vk_right,
	camera_up:		vk_up,
	camera_down:	vk_down,
	
	scroll_up:	vk_up,
	scroll_down:	vk_down,
	
	mouse_attack: true,
	attack:		noone,
	
	inventory:	ord("E"),
	map:		ord("M"),
	pause_key:	ord("P")
}

default_keyboard_only = {
	move_left : vk_left	,
	move_right: vk_right,
	move_up   : vk_up,
	move_down : vk_down,
	jump	  : vk_space,
	
	select	  : vk_enter,
	
	camera_left:	ord("A"),
	camera_right:	ord("D"),
	camera_up:		ord("W"),
	camera_down:	ord("S"),
	
	scroll_up:		ord("W"),
	scroll_down:	ord("S"),
	
	mouse_attack: false,
	attack:		ord("Z"),
	
	inventory:	ord("E"),
	map:		ord("M"),
	pause_key:	ord("P")
}

function save_keybinds(){
	var _save_string = json_stringify(global.keys);
	var _file = file_text_open_write("keybinds.txt");
	file_text_write_string(_file,_save_string);
	file_text_close(_file);	
}

function load_keybinds(){
	
	var _file = file_text_open_read("keybinds.txt")
	if (_file==-1){
		print("Load failed, file not found");
		return -1
	}
	
	var _string = file_text_read_string(_file);
	var _struct = json_parse(_string);
	
	global.keys = variable_clone(_struct);
	
}

function set_keybinds(){
	with(o_keybinder){
		global.keys[$ controlled_input] = assigned_key;	
	}
	
}
function reset_keybinds(){
	global.keys= variable_clone(global.default_keyboard_mouse);
	global.temp_keys = variable_clone(global.default_keyboard_mouse);
	with(o_keybinder){
		assigned_key = global.keys[$ controlled_input];
		key_name = chr(assigned_key);	
	}
	
}
//Temporary struct used during keybinding (so to give the user a chance to confirm)

temp_keys = {
	move_left : ord("A"),	
	move_right: ord("D"),
	move_up   : ord("W"),
	move_down : ord("S"),
	jump	  : vk_space,
	
	select	  : vk_enter,
	
	camera_left:	vk_left,
	camera_right:	vk_right,
	camera_up:		vk_up,
	camera_down:	vk_down,
	
	menu_up:	vk_up,
	menu_down:	vk_down,
	
	mouse_attack: false,
	attack:		ord("L"),	//idk man. get Adam to choose more wisely
	
	inventory:	ord("E"),
	map:		ord("M"),
	pause_key:	ord("P")
}