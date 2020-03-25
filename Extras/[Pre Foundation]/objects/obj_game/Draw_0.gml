draw_set_color(c_white);

// Font direction /////////////////////////////////////////////////////////////
fontAng += fontDir * 0.25;

if (fontAng > 4)
    fontDir = -1;
if (fontAng < -4)
    fontDir = 1;
///////////////////////////////////////////////////////////////////////////////

// Debug text
draw_set_halign(fa_center);

var _x1 = view_w + 8 + (6.5 * 11);
var _y1 = view_h + 8;
var _x2 = view_w + 8 + (8 * 11);
var _y2 = view_h + 24;

//draw_text_transformed(_x1, _y1, string_hash_to_newline(string("GAME END (ESC)")),   1, 1, fontAng);
//draw_text_transformed(_x2, _y2, string_hash_to_newline(string("GAME RESTART (R)")), 1, 1, fontAng);