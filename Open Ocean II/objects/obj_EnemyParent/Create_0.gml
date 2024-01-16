/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// These variables tell the controller the random bounds for the spawning interval,
// essentially defining when the controller is allowed to spawn another enemy instance.
spawn_delay = 0;
spawn_timer_min = 0;
spawn_timer_max = 0;

// Default horizontal movement for enemies
function enemy_movement_default(spd, delta) {
	x += spd * delta;
}

// Delete enemies when they collide with the cyan walls.
function enemy_boundary_collision() {
	if (place_meeting(x, y, obj_BoundaryEnemy) && !is_first_copy) {
		with (self) {
			instance_destroy(self)	
			show_debug_message("Enemy Destroyed.");
		}
	}	
}

// Enemies subtract damage from their HP and reduce the pierce of the incoming bullets.
// Called via collision events with each weapon to read and alter the weapon's variables.
function enemy_bullet_collision() {
	if (!is_first_copy && !array_contains(other.enemies_hit, self)) {
		self.enemy_hp -= other.weapon_damage;
		show_debug_message($"Hit! HP: {self.enemy_hp} - {other.weapon_damage}");
		other.weapon_pierce--;
		array_push(other.enemies_hit, self);
	}
}

// Delete enemies when their HP is equal to or below zero.
function enemy_check_hp(hp = enemy_hp) {
	if (floor(hp) <= 0) {
		with(self) {
			instance_destroy(self);
			show_debug_message("Enemy Defeated!");
		}
	}
}
