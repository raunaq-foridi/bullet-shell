/// @description avoid memory leak.
ds_list_destroy(list);
ds_list_destroy(cleanup_list);
surface_free(menu_surf);