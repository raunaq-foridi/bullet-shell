/// @description Insert description here
// You can write your code in this editor
repeat_move(vel_x,vel_y);
if (hp<=0 or not alive){
	//instance_deactivate_object(id);
	alive=false;
	instance_destroy();
}
if (not invincible){
	visible=true;
	image_alpha=1;
	

}
state = [["hp",hp],["alive",alive]];
if(alarm[4]>0){ image_blend= c_red}
else{image_blend = c_white}
//TODO: Replace with some flash shader