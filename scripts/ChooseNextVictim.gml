victim = FindVictim();
if (victim != noone) {
    ChangeWolfState(WolfState.RUN);
    movePosX = TILE_WIDTH * floor(x / TILE_WIDTH) + TILE_WIDTH / 2;
    movePosY = TILE_HEIGHT * floor(y / TILE_HEIGHT) + TILE_HEIGHT / 2;
} else {
    ChangeWolfState(WolfState.IDLE);
    if (path_exists(pathToVictim))
        path_delete(pathToVictim);
}
