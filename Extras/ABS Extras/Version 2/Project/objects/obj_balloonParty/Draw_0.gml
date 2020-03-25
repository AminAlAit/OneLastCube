/// @description Insert description here
// You can write your code in this editor


randomize();

k = random_range(1, 10);

if (count % 20 == 0)
	r = random_range(1, 10);

if (r < 4)
	shader_set(shd_balloonColor);
else 
	if (r < 8)
	shader_set(shd_balloonColor);
if (die) {
	shader_set(shd_balloonExplode);
	shader_params = shader_get_uniform(shd_balloonExplode, "u_vParams");
	shader_set_uniform_f(shader_params, k, 0, 0.0);
}
draw_self();
shader_reset();