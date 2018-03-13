var largePaveNum = 4;
var smallPaveNum = 2;

for (var i = 0; i < TILE_CNT_HORIZONTAL; i += 1) {
    for (var j = 0; j < TILE_CNT_VERTICAL; j += 1) {
        var tile = tile_layer_find(900000, TILE_WIDTH * i, TILE_HEIGHT * j);
        if (tile >=  0) {
            var index = floor(tile_get_left(tile) / TILE_WIDTH);
            var newIndex;
            if (index < largePaveNum) newIndex = irandom(largePaveNum - 1);
            else newIndex = largePaveNum + irandom(smallPaveNum - 1);
            tile_set_region(tile, TILE_WIDTH * newIndex, 0, TILE_WIDTH, TILE_HEIGHT);
        }
    }
}

