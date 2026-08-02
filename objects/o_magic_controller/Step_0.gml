/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("Q"))) {
	image_speed = 1;
	element = (element+1) mod 3;
}
