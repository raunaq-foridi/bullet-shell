/// @description Initialise keyboard position

//A Manager object to track the position of the keyboard selection
//Object should never be destroyed, and should probably not be deactivated ever

keyboard_grid = ds_grid_create(5,5); //arbitrary default. change via ds_grid_resize()

//The intent is to map objects or slots to this grid, and let this controller report back which is being selected

keyboard_pos = [0,0];

//a value of 1 means an object is on that part of the grid
//0 means it is empty and should be skipped
//less than 0.5 means "move left when entered vertically, otherwise skip"
//more than 0.5 means "move right when entered vertically, otherwise skip"
//the decimals exist to make fat objects that take multiple space

enabled = true;	//Use to disable when needed. Make sure to re enable

hold_start_delay = 30;	//how many frames before moving through quickly?
hold_interval = 3;		//when holding, move every ___ frames. Unused for now
holding=false;
cooldown=false;

//gamepad support
gamepads=[]
deadzone=0.1