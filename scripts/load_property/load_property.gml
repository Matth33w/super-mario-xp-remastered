function load_property(loadProp){
	ini_open("save_data.xp");
	loadmap = ds_map_create();
	
	iniData = ini_read_string("save-data", "content", "");
	
	if(iniData != "") {
		ds_map_read(loadmap, iniData);
		return ds_map_find_value(loadmap, loadProp);
	}
	
	ini_close();
	return false;
}