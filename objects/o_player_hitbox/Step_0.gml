/// @description Insert description here
// You can write your code in this editor
x+=vel_x;
y+=vel_y;

if(follow_player==true){
	x=o_player.x +rel_x;
	y=o_player.y +rel_y;
}
