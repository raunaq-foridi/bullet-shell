/// @description Insert description here
// You can write your code in this editor
selection-=1;
selection%=array_length(text);
if(selection<0){
	selection += array_length(text)
}