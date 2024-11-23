/// @description Insert description here
// You can write your code in this editor
if(not paused){
	paused=true;
	
	pause_image= sprite_create_from_surface(application_surface,0,0,2*o_hud.camera_width,2*o_hud.camera_height,false,false,0,0);
	//draw_sprite(_pause_image,0,0,0);
	//sprite_delete(_pause_image);
	instance_deactivate_all(true);
}
else{
	paused=false;
	sprite_delete(pause_image);
	instance_activate_all();}