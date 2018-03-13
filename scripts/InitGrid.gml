grid = mp_grid_create(0, 0, room_width / TILE_WIDTH, room_height / TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT);

with (Building) {
    mp_grid_add_instances(other.grid, self, false);
}

with (Block) {
    mp_grid_add_instances(other.grid, self, false);
}
