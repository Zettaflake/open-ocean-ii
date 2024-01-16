/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Set bullets to spawn at the submarine sprite's gun barrel.
x = obj_Submarine.x + 12;
y = obj_Submarine.y + 7;


// Default horizontal movement for bullets.
function bullet_movement_default(spd, delta) {
	x += spd * delta;
}

// Bullets check if their pierce is below or equal to 0, 
// deleting themselves if true.
function bullet_check_pierce(pierce = weapon_pierce) {
	if (floor(pierce) <= 0) {
		with (self) {
			instance_destroy(self);
			show_debug_message("Bullet Pierce = 0.");
		}
	}
} 

// Set an alarm that destroys the instance after a number of 
// frames defined by child.
function bullet_set_life(time = weapon_life) {
	alarm[1] = time;
}

// Delete bullets when they collide with the magenta walls.
function bullet_boundary_collision() {
	if (place_meeting(x, y, obj_BoundaryBullet) && !is_first_copy) {
		with (self) {
			instance_destroy(self)	
			show_debug_message("Bullet Destroyed.");
		}
	}	
}