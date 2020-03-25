/// @description Insert description here
// You can write your code in this editor

numBalloons = 50;
i = 0;
j = 0;

for (i = 0; i < numBalloons; ++j) {
	if (j % 15 == 0) {
		with (instance_create_layer(x + 275 + irandom_range(-20, 20), y + 175 + irandom_range(-20, 20), "instances", obj_balloonCollected)){
			hspeed = irandom_range(-40, 40);
			vspeed = irandom_range(-40, 40);
			if (other.i % 2 == 0) {
				minR = 7.0;
				maxR = 13.0;
			}
			
		}
		++i;
	}
}