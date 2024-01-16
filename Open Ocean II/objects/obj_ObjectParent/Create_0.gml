/// @description Insert description here
// You can write your code in this editor

// Define variables to be shared for cross-referencing

// Weapons
	// How fast the bullet travels
	weapon_speed = 0;
	
	// How much the bullet reduces an enemy's HP upon collision
	weapon_damage = 0;

	// How many times the bullet can hit an enemy before being destroyed
	weapon_pierce = 0;
	
	// The number of frames a bullet can last before being destroyed
	weapon_life = 0;

	// The number of frames before a bullet can be fired again
	fire_delay = 0;
	
	// Tells the submarine that a bullet can be fired
	fire_ready = false;
	
	// Prevents weapons with over 1 pierce from hitting the same enemy multiple times
	enemies_hit = [];

// Enemies
	// How fast the enemy travels
	ememy_speed = 0;
	
	// If the enemy's HP reaches 0, it is destroyed.
	enemy_hp = 0;

// delta_time
	// The number to be multiplied with speed to compensate for unstable frames
	delta_multiplier = 0;
	
	// The denominator represents the target framerate 
	target_delta = 1/60;

// Hide the first instance (preset in the room before game launches)
// that spawners like the controller and submarine will reference.
function first_copy(object) {
	if instance_exists(object) {
		with (object) {
			x = 0;
			y = 0;
			image_alpha = 0;
		}
	}
	else {
		show_debug_message("first_copy, That's not an object!");
	}
}


// Fetch delta_time (time between the last frame and the next) to stabilize movement.
function delta_setup(target = target_delta) {
	delta = delta_time / 1000000;
	multiplier = delta/target;
	
	return multiplier;
}


