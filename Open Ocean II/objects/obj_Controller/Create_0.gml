/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Define enemies to be referenced and spawned over time
enemies = [obj_NormalFish, obj_Anchovy, obj_Bass];
enemy_index = 0;


// Set the number of frames before spawning an enemy. Each alarm sets itself again after triggering.
alarm[0] = 200;
alarm[1] = 100;
alarm[2] = 400;



