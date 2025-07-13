//Saving the game.
//Currently called directly by the save crystal object, this will later be through a menu

function save(){
	//var _save = o_manager.room_saves;
	var _save = o_manager.room_saves_struct;
	//var _string = json_encode(_save,false);
	var _string = json_stringify(_save,false);
	var _file = file_text_open_write("test_save.txt");
	//print(working_directory);
	file_text_write_string(_file,_string);
	if (file_exists("test_save.txt")){
		print("YAAAAAAAAAAAAAAAAAAAAAAAA");	
	}
	file_text_close(_file);
}

function load(){
	with(o_pause){pause();}
	var _file = file_text_open_read("test_save.txt");
	if (_file==-1){exit}
	
	var _string = file_text_read_string(_file)
	//var _map = json_decode(_string);
	var _struct = json_parse(_string);
	
	with(o_manager){
		//room_saves = _map;
		room_saves_struct = _struct;
		print("ehh?");
	}
	//room_restart();
}