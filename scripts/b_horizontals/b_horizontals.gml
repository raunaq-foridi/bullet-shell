// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function b_horizontals(_projectile, _proj_speed){
	var _projectile1 = instance_create_layer(x,y,"Instances",_projectile);
	_projectile1.vel_x=_proj_speed;
	var _projectile2 = instance_create_layer(x,y,"Instances",_projectile);
	_projectile2.vel_x=-_proj_speed;

}