/// @description Insert description here
// You can write your code in this editor
x=o_player.x+15*player_facing //+30;
y=o_player.y;

if(o_player.facing="right"){
	image_xscale=0.8;
	player_facing=1;
}
else{
	image_xscale=-0.8;
	player_facing=-1;
}