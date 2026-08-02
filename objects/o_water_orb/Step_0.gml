/// @description Insert description here
// You can write your code in this editor


if(not (input_check("magic") or mouse_check_button(mb_right))){
	
	if((player_face=1 and input_check("move_right")) 
	or (player_face=-1 and input_check("move_left"))){
		
		if(alarm[0]<=0){
			sprite_index = s_hydropump2;
			//image_xscale = 2*player_face;
			player_hitbox(player_face*(40+90),30,180,60,60);
			p_windbox(player_face*(40+90),30,200,60,60,player_face*10,0);
			alarm[0]=70;
		}
	
	}
	else if(alarm[0]<=0){
		if(not finished){
			image_index=0;
			p_windbox(40*player_face,30,60,60,10,player_face*5,0,"circle");
		}
		sprite_index=s_water_orb_burst
		finished=true;
		o_player.occupied=false;
	}
}
o_player.occupied=true;
player_hitbox(40*player_face,30,20,20,1,"circle")