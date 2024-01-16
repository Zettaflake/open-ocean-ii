/// @description Insert description here
// You can write your code in this editor

// Am I the first copy?
if (is_first_copy) {
	first_copy(self);
}

else {
	// Set up delta_time
	delta_multiplier = delta_setup();

	// Apply delta_time to speed
	bullet_movement_default(weapon_speed, delta_multiplier);

	// Check collision with boundaries. Destroy instance if touching.
	bullet_boundary_collision();
	
	// Check if pierce = 0 (pierce is reduced by 1 upon contact with an enemy)
	bullet_check_pierce(weapon_pierce);
	
}



