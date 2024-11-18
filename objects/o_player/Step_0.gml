/// @description Carries out motion
// You can write your code in this editor
var _speed = sqrt(sqr(vel_x)+sqr(vel_y));
if(_speed>max_vel){
	vel_x*= max_vel/_speed;
	vel_y*= max_vel/_speed;
}
repeat_move(vel_x,vel_y);
print(vel_x, vel_y, _speed);
