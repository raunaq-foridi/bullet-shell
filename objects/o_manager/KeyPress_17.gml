/// @description Insert description here
// You can write your code in this editor
print("Testing JSON:");
var _decode = json_decode(test_json);
//var _recode = json_encode(_decode);
//print(_recode);							//no info lost
var _room2_state = _decode[? "Room2"];
//var _recode = json_encode(_room2_state);
//print(_recode);							//{"o_lever#x1504#y429":[["activated",1.0],["tag",""]]} 
//print(_room2_state);
/*print(ds_map_find_first(_room2_state));
print(_room2_state[? "o_lever#x1504#y429"]);*/

var _state = _room2_state[? "o_lever#x1504#y429"];
print(_state);

var _take2 = json_decode(@'{"o_lever#x1504#y429":["why","not"]}');
var _test = json_encode(_take2[? "o_lever#x1504#y429"]);
var _test2 = json_encode(_take2);

var _test3 = json_parse(_test2);
var _test4 = _test3[$ "o_lever#x1504#y429"];
print(_test4);
//var _huh = _take2[| 0];
//print(typeof(_take2));
//print(_test[| 0]);
//print(_take2[? "o_lever#x1504#y429"]);
