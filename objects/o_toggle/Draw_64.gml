/// @description Insert description here
// You can write your code in this editor
//draw_text(x,y,text)
/*if(state==true){image_index=1;}
else{image_index=0;}*/
//draw_self();

if (hovering){
	
	if(state==false){image_index=TOGGLE_SPRITES.OFF_HOVERED}
	else { image_index=TOGGLE_SPRITES.ON_HOVERED;}
	
}
else{
	if(state==false){image_index=TOGGLE_SPRITES.OFF;}
	else { image_index=TOGGLE_SPRITES.ON;}
	
}