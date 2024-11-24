/// @description Insert description here
// You can write your code in this editor

if (moving="down"){
	if (y-start_y<range){y+=1;}
	else{moving="up";}
}

else{
	if (start_y-y<range){y-=1;}
	else{moving="down";}
}