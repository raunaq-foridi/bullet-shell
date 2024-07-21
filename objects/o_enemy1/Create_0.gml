/// @description Initialise enemy 1

//All Enemies should be set as children of enemyParent
//Then, all collision events and anything shared for all enemies should be done on enemyParent
//Create event is unnecessary if not deviating from default values

hp=100;
contact=1;
knockback=20;

grounded=false;
terminal_speed=100;
grav_speed=1;

vel_x=0;
vel_y=0;