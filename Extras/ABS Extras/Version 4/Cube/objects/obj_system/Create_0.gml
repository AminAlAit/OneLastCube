/// @description Insert description here
// You can write your code in this editor

// System Variables
enum systemState {
		
}

// Home Variables
home_present = true;
home_fish = 0;
home_radish = 0;
home_wood = 0;
home_stone = 0;
home_hunger = 0; // out of 100?
home_protection = 0; // out of 100?
home_happiness = 0; // out of 100?


// Player Variables
player_self = obj_cube;
player_fish = 0;
player_radish = 0;
player_wood = 0;
player_stone = 0;
player_storage = 30; // how much can you carry
player_location = location.home;
player_energy = 12; // each unit is 1 hr

enum location {
	home,
	location01,
	location02,
	location03
}
