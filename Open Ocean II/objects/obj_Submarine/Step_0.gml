/// @description Insert description here
// You can write your code in this editor
// When detected, each keyboard input will return the value 1. Otherwise, each will return 0.
right_key = keyboard_check(vk_right);
down_key = keyboard_check(vk_down);
up_key = keyboard_check(vk_up);
left_key = keyboard_check(vk_left);
fire_key = keyboard_check(vk_space);
switch_key_prev = keyboard_check(ord("Z"));
switch_key_next = keyboard_check(ord("X"));

// Load equipped weapon object and associated stats
weapon = weapons[weapon_number];

// Delta_time keeps movement stable through sudden lag spikes and frame drops.
target_delta = 1/60;
delta = delta_time / 1000000;
delta_multiplier = delta/target_delta;

// Get input and multiply by defined speed to set movement variables.
// Down and right are positive values, while left and up are negative values.
x_spd = (right_key - left_key) * spd * delta_multiplier;
y_spd = (down_key - up_key) * spd * delta_multiplier;

// Apply variables to movement.
// Check for collision w/ boundaries.
if(!place_meeting(x + 4, y, boundaries) && floor(x_spd) > 0) {
	x += x_spd;	
}
if(!place_meeting(x - 4, y, boundaries) && floor(x_spd) < 0) {
	x += x_spd;	
}

if(!place_meeting(x, y + 4, boundaries) && floor(y_spd) > 0) {
	y += y_spd;
}
if(!place_meeting(x, y - 4, boundaries) && floor(y_spd) < 0) {
	y += y_spd;	
}


// If the fire key (spacebar) is held down, and the weapon cooldown is ready, then fire a bullet.
// Set fire_ready, a boolean, to false, then set an alarm that sets it to true after a  specified cooldown.
if(fire_key && weapon.fire_ready) {
	with (instance_create_layer(x, y, "MainLayer", weapon)) {
		is_first_copy = false;
	}
	weapon.fire_ready = false;
	weapon.alarm[0] = weapon.fire_delay;
	show_debug_message($"Bullet created. DMG: {weapon.weapon_damage}, Alpha: {weapon.image_alpha}, is_first_copy: {weapon.is_first_copy}")
}

// Change the index by 1, accessing the next weapon in the array.
if(switch_key_next) {
	if (array_length(weapons) <= weapon_number + 1){
		weapon_number = 0;
	}
	else {
		weapon_number += 1;
	}
}

// Change the index by -1, accessing the previous weapon in the array.
if(switch_key_prev) {
	if (weapon_number <= 0) {
		weapon_number = array_length(weapons) - 1;
	}
	else {
		weapon_number -= 1;
	}
}

/*show_debug_message($"Right Key Input {right_key}");
show_debug_message($"x_spd: {x_spd}");
show_debug_message($"fire_delay: {fire_delay}");
show_debug_message($"fire_ready: {weapon.fire_ready}");*/
