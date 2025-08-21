/// @description Draw player
x=o_player.x;
y=o_player.y;

//climbing
if(o_player.climbing){
	image_xscale=1;
	sprite_index=s_player_climb_TEMP;
	if(input_check("move_up")){counter+=1;}
	else if (input_check("move_down")){counter-=1;}
	
	image_index = counter div climb_interval;
	print(counter div climb_interval);
	exit
}
counter=0;
//normal movement

if (abs(o_player.dir[0])!=0){image_xscale=o_player.dir[0]}
if(not o_player.falling){
	if(abs(o_player.vel_x)>=0.6){sprite_index=s_player_run}
	else{sprite_index=s_player_idle}
}
//jump/fall
else{sprite_index=s_player_faller}