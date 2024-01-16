/// @description Insert description here
// You can write your code in this editor

// Establish initial speed values;
spd = 5;
x_spd = 0;
y_spd = 0;

// When detected, each keyboard input will return the value 1. Otherwise, each will return 0.
right_key = keyboard_check(vk_right);
down_key = keyboard_check(vk_down);
up_key = keyboard_check(vk_up);
left_key = keyboard_check(vk_left);

// Define weapons, equipped in an object array. weapon_number is the index that selects the weapon.
weapons = [obj_Peashot, obj_Harpoon];
weapon_number = 0;

// Define the boundaries to prevent submarine from leaving visible screen.
boundaries = obj_BoundarySubmarine;

//show_debug_log(enable);
//show_debug_message("Hello World!");
