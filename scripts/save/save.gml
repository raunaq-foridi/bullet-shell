//Saving the game.
//Currently called directly by the save crystal object, this will later be through a menu

function save(_slot=1){

	//save room data (temporary, will be amended)	
	var _room_save = o_manager.room_persist_struct;
	//var _room_string = json_stringify(_room_save,false);
	//save player data
	var _player_data ={};
	_player_data.inventory = o_manager.inventory;
	_player_data.equipment = o_player.equipment;
	_player_data.max_hp = o_player.max_hp;
	_player_data.gears = o_manager.gears;
	_player_data.x= o_player.x;
	_player_data.y= o_player.y;

	var _world_data = {};
	_world_data.rooms = _room_save;
	_world_data.flags = {};				//populate this eventually I guess
	_world_data.current_room = room;
	
	var _save = {}
	_save.player = _player_data;
	_save.world = _world_data;
	
	var _save_string = json_stringify(_save,false);
	var _file = file_text_open_write("test_save"+string(_slot)+".txt");
	file_text_write_string(_file,_save_string);
	file_text_close(_file);
}

function load(_slot=1){
	with(o_pause){pause();}
	var _file = file_text_open_read("test_save"+string(_slot)+".txt");
	if (_file==-1){exit}
	
	var _string = file_text_read_string(_file)
	var _struct = json_parse(_string);
	
	var _player_data = _struct.player;
	room_goto(_struct.world.current_room);
	var _room_data = _struct.world.rooms;
	with(o_manager){
		room_persist_struct = _room_data;
		inventory = _player_data.inventory;
		gears = _player_data.gears;
		print("ehh?");
	}
	with(o_player){
		equipment = _player_data.equipment;
		max_hp = _player_data.max_hp;
		x = _player_data.x;
		y = _player_data.y;
	}
	//o_inventory_menu.small_slots=_player_data.equipment;
}

function read(_slot=1){
	//read key details from a saveslot for preview purpose
	
}