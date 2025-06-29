/// @description holds Global Variables

//useful for Settings.
global.mute =false;
global.volume= 1;
global.dummy= 0;		//dummy variable for testing or holding values. No intended use. Do not make it important.

//Persistent Variables
coins = 0; //This is NOT for final usage. This is for testing purposes
gears = 0; //This ones probably for final usage.

//inventory
inv_size=30;
inventory=array_create(inv_size,[0,0]);	//Create an Array of 0's
//inventory format: [itemID,count]

function item_pickup(_item_id){
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
