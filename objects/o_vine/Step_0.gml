/// @description Insert description here
// You can write your code in this editor

if (moving="right"){
	if (x-start_x<range){x+=1;}
	else{moving="left";}
}

else{
	if (start_x-x<range){x-=1;}
	else{moving="right";}
}