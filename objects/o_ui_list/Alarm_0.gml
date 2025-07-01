/// @description perform on the frame AFTER creation

for(var _i=0; _i<array_length(other_lists); _i++){
	create_button(x + 50*_i,y-50,1,1,"",change_menu,[other_lists[_i],other_lists],true);
}