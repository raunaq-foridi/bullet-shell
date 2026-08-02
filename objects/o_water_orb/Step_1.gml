/// @description Insert description here
// You can write your code in this editor
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