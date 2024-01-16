/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

weapon_speed = 7.5;
weapon_pierce = 1;
weapon_damage = 5;
weapon_life = 60;
fire_delay = 18;

// Set alarm. 1 is counted down each frame.
alarm[0] = fire_delay;
bullet_set_life();