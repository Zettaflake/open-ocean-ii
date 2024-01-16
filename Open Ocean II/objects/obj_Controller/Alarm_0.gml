/// @description Insert description here
// You can write your code in this editor

enemy_index = 0;

instance_create_layer(1440, random_range(100, 800), "MainLayer", enemies[enemy_index]);
alarm[0] = random_range(enemies[enemy_index].spawn_timer_min, enemies[enemy_index].spawn_timer_max);



