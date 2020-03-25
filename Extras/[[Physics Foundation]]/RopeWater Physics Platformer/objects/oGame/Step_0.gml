// Initialize input variables
var kRestart, kQuit;

kRestart   = keyboard_check_pressed(ord("R"));
kQuit      = keyboard_check_pressed(vk_escape);

// Restart application
if (kRestart)
    room_restart();
    
// Close application
if (kQuit)
    game_end();

