/// @description avoid memory leak.

instance_destroy(o_generic_button);
for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
			instance_destroy(cleanup_list[| _i]);
}
ds_list_destroy(cleanup_list);
ds_list_destroy(list);
surface_free(menu_surf);
instance_destroy(close);
instance_destroy(scrollslot);
print(instance_count);
//print("cleaned!");