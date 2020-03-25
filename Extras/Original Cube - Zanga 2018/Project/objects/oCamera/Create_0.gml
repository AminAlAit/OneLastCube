///// @description Set up Camera
//cam         = view_camera[0];
//follow      = oPlayer;
//view_w_half = camera_get_view_width(cam)  * 0.5;
//view_h_half = camera_get_view_height(cam) * 0.5;
//xTo         = xstart;
//yTo         = ystart;

camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho( 1024, 768, 1, 1000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = oPlayer;
xTo = x;
yTo = y;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;