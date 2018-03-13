globalvar TILE_WIDTH, TILE_HEIGHT, TILE_CNT_HORIZONTAL, TILE_CNT_VERTICAL;
TILE_WIDTH = sprite_get_width(RuralTileS);
TILE_HEIGHT = sprite_get_height(RuralTileS);
TILE_CNT_HORIZONTAL = ceil(room_width / TILE_WIDTH);
TILE_CNT_VERTICAL = ceil(room_height / TILE_HEIGHT);

globalvar HUMANITY_TIME_FULL;
HUMANITY_TIME_FULL = 5;

enum Direction {
    EAST,
    WEST,
    SOUTH,
    NORTH,
    NORTH_WEST,
    NORTH_EAST,
    SOUTH_WEST,
    SOUTH_EAST
}

enum TileType {
    RURAL,
    URBAN
}

enum Pavement {
    NONE,
    LARGE,
    SMALL
}

enum CharState {
    IDLE,
    RUN,
    STUNNED,
    PANIC
}

enum WolfState {
    IDLE,
    RUN,
    STUNNED,
    JUMP,
    DIE,
    ATTACK,
    SCULPT,
    CONTROL
}

enum GunmanState {
    IDLE,
    RUN,
    SHOOT
}

enum HUDState {
    OPEN,
    OPENING,
    CLOSED,
    CLOSING
}

enum AlphaState {
    TRANSPARENT,
    OPAQUE
}

enum TimeState {
    DAY,
    NIGHT,
    OVER
}

enum BloodType {
    FLOODING,
    BIG,
    MIDDLE,
    SMALL
}

enum CivilianType {
    MAN,
    WOMAN,
    SMALL_MAN,
    SMALL_WOMAN
}
