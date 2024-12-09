// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function detect_tile(_relX,_relY){ //checks for a tile collision, if the object was moved by (relx,relY)
	
	//gets the id of the collision layer, and then gets the id of the map it uses
	var _lay_id = layer_get_id("solid_tiles");
	var _map_id = layer_tilemap_get_id(_lay_id);
	
	//Do the same for the complex tile layer
	var _lay_id2= layer_get_id("complex_tiles");
	var _map_id2 = layer_tilemap_get_id(_lay_id2);
	//checks for a tile where specified
	var _collision=false;
	if(place_meeting(x+_relX,y + _relY, _map_id)){		//detect solid tiles
		_collision=true;}
		
	if(place_meeting(x+_relX,y + _relY, _map_id2)){		//detect complex tiles
		_collision=true;}

	if(place_meeting(x+_relX,y + _relY, o_solid_platform)){
		_collision=true;}
	
	return _collision
}
