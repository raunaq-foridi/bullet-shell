/// @description Right
// You can write your code in this editor
facing="right";
if(climbing and climbable){
	if(not climbable.lock_x){
		repeat_move(climb_speed,0);
	}
}
else{
	if(vel_x<=move_speed){vel_x=move_speed;}
	dir[0]=1;
}