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
	//print(counter div climb_interval);
	exit
}
counter=0;
//normal movement

if (abs(o_player.dir[0])!=0){image_xscale=o_player.dir[0]}
if(not o_player.falling){
	
	if(abs(o_player.vel_x)>=0.6){sprite_index=s_player_run}
	else{sprite_index=s_player_idle}
	
	//crouching
	if(input_check("move_down")){sprite_index=s_player_crouch;}
}
//jump/fall
else{sprite_index=s_player_faller}

//Attacking: Takes priority

if(o_player.attack_state>0){
	//print("Attack tracked");
	sprite_index=o_sword.player_sprite;
	image_index=o_sword.image_index;
	
}