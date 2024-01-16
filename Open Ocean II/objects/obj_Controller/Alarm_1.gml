/// @description Insert description here
// You can write your code in this editor

enemy_index = 1;


instance_create_layer(1440, random_range(100, 800), "MainLayer", enemies[enemy_index]);
/*
for (var n = random_range(3,8), floor(n) <= 0, n--) {
	alarm[1] = random_range(10, 30);
} */

alarm[1] = random_range(enemies[enemy_index].spawn_timer_min, enemies[enemy_index].spawn_timer_max);




