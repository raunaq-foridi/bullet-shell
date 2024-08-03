/// @description Insert description here


if(timer>360){timer-=360;}
if(timer%120=0){
	
	b_horizontals(o_projBall, 2);
	
	//the script above runs the code below
	//Since we will probably reuse bullet patterns, we can make them as scripts.
	//b_horizontals() simply shoots both projectiles at equal speed at either side
	//o_projBall experiences gravity, so it moves diagonally.
	
	
	//var _projectile1 = instance_create_layer(x,y,"Instances",o_projBall);
	//_projectile1.vel_x=2;
	//var _projectile2 = instance_create_layer(x,y,"Instances",o_projBall);
	//_projectile2.vel_x=-2;
	
	
}