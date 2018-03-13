path_delete(pathToVictim);
pathToVictim = path_add();

var pathFound = mp_grid_path(grid, pathToVictim,
                         TILE_WIDTH * floor(x / TILE_WIDTH) + TILE_WIDTH / 2,
                         TILE_HEIGHT * floor(y / TILE_HEIGHT) + TILE_HEIGHT / 2,
                         TILE_WIDTH * floor(victim.x / TILE_WIDTH) + TILE_WIDTH / 2,
                         TILE_HEIGHT * floor(victim.y / TILE_HEIGHT) + TILE_HEIGHT / 2, false);
if (!pathFound) {
    show_message("PATH NOT FOUND!");
    game_end();
}

