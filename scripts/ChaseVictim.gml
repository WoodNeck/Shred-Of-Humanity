var speedX = sign(movePosX - x) * moveSpeed;
var speedY = sign(movePosY - y) * moveSpeed;

var barricade = instance_position(x + speedX, y + speedY, Barricade);
var shouldMoveX = abs(movePosX - x) > abs(speedX);
var shouldMoveY = abs(movePosY - y) > abs(speedY);
if (barricade != noone) {
    attackTarget = barricade;
    ChangeWolfState(WolfState.ATTACK);
} else {
    if (victim == noone) exit;
    
    if (sqr(victim.x - x) + sqr(victim.y - y) < sqr(TILE_WIDTH)) {
        if (victim.object_index == Civilian) {
            movePosX = victim.x;
            movePosY = victim.y;
            victim.state = CharState.STUNNED;
        } else {
            movePosX = TILE_WIDTH * floor(victim.x / TILE_WIDTH) + TILE_WIDTH / 2;
            movePosY = TILE_HEIGHT * floor(victim.y / TILE_HEIGHT) + TILE_HEIGHT / 2;
        }
        
        if (movePosX < x) xScale = -1;
        else if (movePosX > x) xScale = 1;
        
        ChangeWolfState(WolfState.JUMP);
    } else {
        if (shouldMoveX) x += speedX;
        if (shouldMoveY) y += speedY;
        if (shouldMoveX) {
            if (speedX < 0) xScale = -1;
            else if (speedX > 0) xScale = 1;
        }
        if (!shouldMoveX && !shouldMoveY) {
            victim = FindVictim();
            FindPathToVictim();
            movePosX = path_get_point_x(pathToVictim, 1);
            movePosY = path_get_point_y(pathToVictim, 1);
        }
    }
}
