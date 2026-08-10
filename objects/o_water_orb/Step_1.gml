/// @description Insert description here
// You can write your code in this editor
if(alarm[0]<=0){
	if( o_player.facing =="right"){
	
		x = o_player.x + 40;
		y = o_player.y +30;
		player_face=1;
	}
	else{
		x = o_player.x - 40;
		y = o_player.y +30;
		player_face=-1;
	}

	image_xscale = 2*player_face;
	image_yscale = 2;
	visible=true;
	
	o_magic_controller.mana-=1;
	if( o_magic_controller.mana<1){instance_destroy();}
}
if(sprite_index = s_hydropump2){
	
	if( o_player.facing =="right"){
	
			x = o_player.x + 40;
			y = o_player.y +30;
		}
		else{
			x = o_player.x - 40;
			y = o_player.y +30;
		}
		
}
else if(sprite_index = s_brine){
	
	x=o_player.x;
	y=o_player.y+64;
	
}