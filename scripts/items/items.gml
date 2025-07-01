//This script will hold all items and their properties etc.

enum ITEM_ID{
	PLACEHOLDER,
	ARTEFACT1,
	ARTEFACT2,
	GREEN
}

enum ITEM_PROP{
	ID,
	NAME,
	SPRITE,
	SIZE,
	DESCRIPTION
}
//Actual item properties [?]
item = [
["PLACEHOLDER","Placeholder artefact",0,"small",""], //blank because it is the empty slot, actually
["ARTEFACT1","Sound Artefact",s_artefact_1,"small","This Artefact plays a sound upon swinging your sword"],
["ARTEFACT2","Another artefact",s_artefact_2,"small","This Artefact does nothing at all"]
];