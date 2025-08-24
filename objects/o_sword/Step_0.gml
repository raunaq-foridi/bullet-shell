/// @description Insert description here
// You can write your code in this editor

//This type of melee attack will be retired
//Instead, we will summon invisible hitbox objects, and play an animation. o_sword will just be the controller for these

if (mouse_check_button_pressed(mb_left) or input_check("attack")){
	image_index=0;
	if (not recharging){
		recharging=true;
		visible=true;
		attacking=true;
		alarm[1]=attack_duration;
		alarm[2]=cooldown;
		
		//Hitbox time
		player_hitbox(30*player_facing,40,40,20,attack_duration,"box",0,true);
		player_hitbox(30*player_facing,50,40,20,attack_duration,"circle",10,true);
		
	}	
	
}

//There will be more than a single type of melee attack. The logic for this will be below
//mask_index=noone;
//mask_index = s_test_hitbox;
//draw_sprite(mask_index,-1,x,y);

