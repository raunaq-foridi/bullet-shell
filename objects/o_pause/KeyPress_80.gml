/// @description Insert description here
// You can write your code in this editor
if(not paused){
	paused=true;
	
	pause_image= sprite_create_from_surface(application_surface,0,0,view_wport[0],view_hport[0],false,false,0,0);
	//draw_sprite(_pause_image,0,0,0);
	//sprite_delete(_pause_image);
	for (var _i=0; _i<instance_count; _i++){
		array_push(active,instance_id[_i]);
	}
	instance_deactivate_all(true);
	create_button(620,190,4.5,1.5,"restart",room_restart);
	create_button(620,290,4.5,1.5,"settings",open_settings);
}
else{
	instance_destroy(o_generic_button);
	//instance_destroy(o_toggle);
	instance_destroy(o_scroll_slot);
	
	/*
	instance_destroy(o_toggle);
	instance_destroy(o_slider_slot);
	instance_destroy(o_text_toggle);
	*/
	if (instance_exists(o_ui_list)){
		for (var _i=0; _i<ds_list_size(o_ui_list.cleanup_list); _i++){
			instance_destroy(o_ui_list.cleanup_list[| _i]);
		}
		instance_destroy(o_ui_list);
	}
	instance_deactivate_all(true);
	paused=false;
	sprite_delete(pause_image);
	for (var _i=0; _i<array_length(active); _i++){
		instance_activate_object(active[_i]);
		}
	active=[];
	}