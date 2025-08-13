/// @description Initialise keyboard position

//A Manager object to track the position of the keyboard selection
//Object should never be destroyed, and should probably not be deactivated ever

keyboard_grid = ds_grid_create(5,5); //arbitrary default. change via ds_grid_resize()

//The intent is to map objects or slots to this grid, and let this controller report back which is being selected

keyboard_pos = [0,0];

