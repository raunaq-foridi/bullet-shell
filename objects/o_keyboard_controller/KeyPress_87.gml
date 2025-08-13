/// @description Upwards

//var _grid_width = ds_grid_width(keyboard_grid);
var _grid_height = ds_grid_height(keyboard_grid);

for (var _i=0; _i<_grid_height; _i++){
	
	keyboard_pos[1]-=1;
	keyboard_pos[1]+=_grid_height;
	keyboard_pos[1]%=_grid_height;
	if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
}

print(keyboard_pos);
//print("grid height",_grid_height);