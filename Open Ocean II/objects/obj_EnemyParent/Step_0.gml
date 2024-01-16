/// @description Insert description here
// You can write your code in this editor

if (is_first_copy) {
	first_copy(self);
}

else {
	// Set up delta_time
	delta_multiplier = delta_setup();

	// Apply delta_time to speed
	enemy_movement_default(enemy_speed, delta_multiplier);

	// Check collision with boundaries
	enemy_boundary_collision();
	
	// Check collision with bullets
	// enemy_bullet_collision();
	
	// Check hp of self
	enemy_check_hp();
}


