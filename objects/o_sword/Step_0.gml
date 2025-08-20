/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button_pressed(mb_left) or input_check("attack")){
	if (not recharging){
		recharging=true;
		visible=true;
		attacking=true;
		alarm[1]=attack_duration;
		alarm[2]=cooldown;
	
	}	
	
}