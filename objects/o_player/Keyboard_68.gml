/// @description Right
// You can write your code in this editor
facing="right";
//climbing code
if(climbing and climbable and not climbable.lock_x){	//ignore code if Locked.
	repeat_move(climb_speed,0);
}
//regular movement
else{
	if(vel_x<=move_speed){vel_x=move_speed;}
	dir[0]=1;
}