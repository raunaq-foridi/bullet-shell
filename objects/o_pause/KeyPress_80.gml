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
	instance_activate_object(o_restart_button);
}
else{
	instance_deactivate_object(o_restart_button);
	paused=false;
	sprite_delete(pause_image);
	for (var _i=0; _i<array_length(active); _i++){
		instance_activate_object(active[_i]);
		}
	active=[];
	}