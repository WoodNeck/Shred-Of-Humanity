randomize();

environmentS = EnvironmentS;

// Constants
var MAP_WIDTH                 = room_width;
var MAP_HEIGHT                = room_height;
var TILE_WIDTH                = sprite_get_width(RuralTileS);
var TILE_HEIGHT               = sprite_get_height(RuralTileS);
var TILE_COUNT_HORIZONTAL     = ceil(MAP_WIDTH / TILE_WIDTH);
var TILE_COUNT_VERTICAL       = ceil(MAP_HEIGHT / TILE_HEIGHT);
var ENVIRONMENT_IMAGE_CNT     = sprite_get_number(environmentS);
ENVIRONMENT_CNT_TOTAL         = TILE_COUNT_HORIZONTAL * TILE_COUNT_VERTICAL;

for (var i = 0; i < ENVIRONMENT_CNT_TOTAL; i += 1) {
    envX[i] = TILE_WIDTH * irandom(TILE_COUNT_HORIZONTAL - 1) + irandom(TILE_WIDTH);
    envY[i] = TILE_HEIGHT * irandom(TILE_COUNT_VERTICAL - 1) + irandom(TILE_HEIGHT);
    envType[i] = irandom(ENVIRONMENT_IMAGE_CNT - 1);
}
