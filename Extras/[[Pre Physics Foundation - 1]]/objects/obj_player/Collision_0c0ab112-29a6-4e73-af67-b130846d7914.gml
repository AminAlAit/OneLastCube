var i;

for (i = 0; i < 32; ++i){
	var _x = xprevious + random_range(-12, 12);
	var _y = yprevious + random_range(-12, 12)
	instance_create_layer(_x, _y, "Effects", obj_blood);
}
instance_destroy();

