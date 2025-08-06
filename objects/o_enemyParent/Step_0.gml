/// @description Insert description here
// You can write your code in this editor
repeat_move(vel_x,vel_y);
if (hp<=0 or not alive){
	//instance_deactivate_object(id);
	alive=false;
	instance_destroy();
}
if (not invincible){visible=true;}
state = [["hp",hp],["alive",alive]];