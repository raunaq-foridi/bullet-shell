/// @description Initialise default enemy
// This should act as a "template"

//other enemy types should use this as a parent, and inherit it's properties
//if in doubt, copy paste this into each enemy and mod from there.

hp = 10; 
contact = 1;  //contact damage. Unsure if it'll ever be greater than 1 but yeah.
knockback=1;

iframes=20;
invincible=false;

grounded=false;
terminal_speed=100;
grav_speed=1;

vel_x=0;
vel_y=0;
