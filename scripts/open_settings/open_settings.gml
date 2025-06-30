// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function open_settings(){
	var _screen_width = view_wport[0];		//consider using screen_get_width()
	var _screen_height = view_hport[0];
	
	var _padding = 100;
	
	var _width = _screen_width - 2*_padding;
	var _height = _screen_height-2*_padding;
	
	//instance_activate_object(o_settings);
	instance_deactivate_object(o_generic_button);
	//create_toggle(620,290,5,5,"Mute toggle","mute");
	create_menu(100,100,_width,_height,list_name("settings"));
}

function true_restart(){
	gc_collect();
	sprite_delete(o_pause.pause_image);
	game_restart();
}