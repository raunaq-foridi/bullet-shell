/// @description Initialise enemy 1

//All Enemies should be set as children of enemyParent
//Then, all collision events and anything shared for all enemies should be done on enemyParent
//Create event is unnecessary if not deviating from default values


//If using a Create event like this, use event_inherited();
//This prevents you having to copy-paste ALL variables - only use the ones modified.

event_inherited();

knockback=10;

vel_x=0;
vel_y=0;