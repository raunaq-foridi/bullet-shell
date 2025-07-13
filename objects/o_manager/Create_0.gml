/// @description holds Global Variables and Inventory

//useful for Settings.
global.mute =false;
global.volume= 1;
global.dummy= 0;			//dummy variable for testing or holding values. No intended use. Do not make it important.
global.text_speed=1;		//works by division, so 5 is 5x less delay
global.dialogue_text_size=2;//specifically for dialogue boxes. May be replaced with text toggle

//Persistent Variables
coins = 0; //This is NOT for final usage. This is for testing purposes
gears = 0; //This ones probably for final usage.

room_saves = ds_map_create();			//ds_map of ds_maps. 1 map per room, titled by room name
//persistent_states = ds_map_create();
room_saves_struct ={};

//inventory
#macro INV_SIZE 30
inventory=array_create(INV_SIZE,[0,0]);	//Create an Array of 0's
//inventory format: [itemID,count]

function item_pickup(_item_id){
	if (_item_id == 0){return}
	//check if item already in inventory
	item_id = _item_id; //jank scope changing
	var _item_search = function(_element,_index){return (_element[0] == item_id);}
	var _index = array_find_index(inventory,_item_search);
	if (_index!=-1){
		inventory[_index][1]+=1;	//if item is in inventory, increase count by 1
		return
	}
	
	//Otherwise, place new item in first empty slot
	var _zero = function (_element,_index){return (array_equals(_element, [0,0]));}
	var _index2 = array_find_index(inventory,_zero);
	//print(inventory[0] == [0,0]);
	//print(_index2);
	if (_index2!=-1){
		inventory[_index2]=[_item_id,1];
	}
	
}
/*item_pickup(2);
item_pickup(3);
item_pickup(2);
print(inventory);*/
test_json = @'{"Room1_Child_0":{"o_lever#x256#y429":[["activated",true],["tag",""]]},"Room2":{"o_lever#x1504#y429":[["activated",true],["tag",""]]},"Room1":{"o_enemy2#x896#y224":[["hp",3.0],["alive",true]],"o_collectible#x928#y320":[],"o_enemyShooter#x672#y288":[["hp",5.0],["alive",true]],"o_collectible#x1600#y128":[],"o_enemy2#x1632#y544":[["hp",3.0],["alive",true]],"o_collectible#x1184#y256":[],"o_enemy1#x512#y320":[["hp",4.0],["alive",true]],"o_lever#x1952#y357":[["activated",true],["tag",""]],"o_enemy2#x1440#y416":[["hp",3.0],["alive",true]],"o_enemy2#x1408#y544":[["hp",2.0],["alive",true]],"o_enemy1#x1376#y448":[["hp",3.0],["alive",true]]}}';
