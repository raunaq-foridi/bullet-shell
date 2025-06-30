// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Checks for the nth nearest instance of an object being interacted with at relative pos _x,_y
//specifically behaves identically to furthest_instance if _dist is set to -1


function nearest_instance(_object,_dist,_x,_y){
	
	//default values
	if(is_undefined(_x)){_x=0;}
	if(is_undefined(_y)){_y=1;}
	if(is_undefined(_dist)){_dist=0;}
	var _instance =0;
	if(place_meeting(x+_x,y+_y,_object)){ // and (abs(x-o_platform.x)<o_platform.clamp_x)
		var _instanceList = ds_list_create();
		instance_place_list(x+_x,y+_y,_object,_instanceList,true); //ordered list of objects intersecting one pixel below
		
		if(_dist<0){_dist=ds_list_size(_instanceList)-_dist;}		//if negative, wrap to nth furthest.
		
		_instance = ds_list_find_value(_instanceList,_dist);	//take nth closest object
		ds_list_destroy(_instanceList);	//memory purposes
	}
	return _instance
}

function sort_distance(_obj1,_obj2){
	//Used to sort objects in *ascending* distance order - closest first
	//Sorting function. Must return 0 if same, -1 is obj1 goes before obj2, and 1 if ob2 goes before obj1
	 /*var _dist1 = distance_to_object(_obj1);
	 var _dist2 = distance_to_object(_obj2);*/
	 var _dist1 = distance_to_point(_obj1.x,_obj1.y);
	 var _dist2 = distance_to_point(_obj2.x,_obj2.y);
	 if (_dist1<_dist2){return -1}
	 else if (_dist2<_dist1){return 1}
	 else{return 0}
	 

}