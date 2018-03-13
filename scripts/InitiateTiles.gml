// Sprites Using
tileSprite[0] = RuralTileS;
tileSprite[1] = UrbanTileS;
paveSprite = PaveTileS;

// Constants
var MAP_WIDTH                 = room_width;
var MAP_HEIGHT                = room_height;
TILE_WIDTH                    = sprite_get_width(tileSprite[0]);
TILE_HEIGHT                   = sprite_get_height(tileSprite[0]);
TILE_COUNT_HORIZONTAL         = ceil(MAP_WIDTH / TILE_WIDTH);
TILE_COUNT_VERTICAL           = ceil(MAP_HEIGHT / TILE_HEIGHT);
var DIRECTION_DIAGONAL_OFFSET = 4;
var URBAN_RATIO               = 0.6;
var JUNCTION_RURAL_MINIMUM    = 3;
var JUNCTION_RURAL_MAXIMUM    = 4;
var JUNCTION_MINIMUM_RADIUS   = 6;
var JUNCTION_MAXIMUM_RADIUS   = 9;
PAVEMENT_LARGE_CNT            = 4;
PAVEMENT_SMALL_CNT            = 2;
PAVEMENT_MINIMUM_WIDTH        = 3;
PAVEMENT_MAXIMUM_WIDTH        = 5;

// Initialize Tiles
for (var i = 0; i < TILE_COUNT_HORIZONTAL; i += 1) {
    for (var j = 0; j < TILE_COUNT_VERTICAL; j += 1) {
        tileType[i, j] = TileType.RURAL;
        tileIndex[i, j] = irandom(19); // TODO: Place appropriate index
        paveType[i, j] = Pavement.NONE;
        paveIndex[i, j] = -1;
    }
}

// Set Urban Area
var whereIsUrban = DIRECTION_DIAGONAL_OFFSET + irandom(3); 
var urbanHorizontalFrom;
var urbanHorizontalTo;
var urbanVerticalFrom;
var urbanVerticalTo;
switch (whereIsUrban) {
    case Direction.NORTH_WEST:
        urbanHorizontalFrom = 0;
        urbanHorizontalTo = floor(TILE_COUNT_HORIZONTAL * URBAN_RATIO);
        urbanVerticalFrom = 0;
        urbanVerticalTo = floor(TILE_COUNT_VERTICAL * URBAN_RATIO);
        break;
    case Direction.NORTH_EAST:
        urbanHorizontalFrom = ceil(TILE_COUNT_HORIZONTAL * (1 - URBAN_RATIO));
        urbanHorizontalTo = TILE_COUNT_HORIZONTAL;
        urbanVerticalFrom = 0;
        urbanVerticalTo = floor(TILE_COUNT_VERTICAL * URBAN_RATIO);
        break;
    case Direction.SOUTH_WEST:
        urbanHorizontalFrom = 0;
        urbanHorizontalTo = floor(TILE_COUNT_HORIZONTAL * URBAN_RATIO);
        urbanVerticalFrom = ceil(TILE_COUNT_VERTICAL * (1 - URBAN_RATIO));
        urbanVerticalTo = TILE_COUNT_VERTICAL;
        break;
    case Direction.SOUTH_EAST:
        urbanHorizontalFrom = ceil(TILE_COUNT_HORIZONTAL * (1 - URBAN_RATIO));
        urbanHorizontalTo = TILE_COUNT_HORIZONTAL;
        urbanVerticalFrom = ceil(TILE_COUNT_VERTICAL * (1 - URBAN_RATIO));
        urbanVerticalTo = TILE_COUNT_VERTICAL;
        break;
    default:
        show_error("Urban 지역 선택값이 올바르지 않음: " + string(whereIsUrban), true);
}

for (var i = urbanHorizontalFrom; i < urbanHorizontalTo; i += 1) {
    for (var j = urbanVerticalFrom; j < urbanVerticalTo; j += 1) {
        tileType[i, j] = TileType.URBAN;
    }
}

// Set Junctions
junction[0, 0] = urbanHorizontalFrom + irandom(urbanHorizontalTo - urbanHorizontalFrom);
junction[0, 1] = urbanVerticalFrom + irandom(urbanVerticalTo - urbanVerticalFrom);
junctionRadius[0] = JUNCTION_MINIMUM_RADIUS + irandom(JUNCTION_MAXIMUM_RADIUS - JUNCTION_MINIMUM_RADIUS);
junction[0, 0] = clamp(junction[0, 0], junctionRadius[0], TILE_COUNT_HORIZONTAL - junctionRadius[0])
junction[0, 1] = clamp(junction[0, 1], junctionRadius[0], TILE_COUNT_VERTICAL - junctionRadius[0])
PlaceJunctionInclusion(junction[0, 0], junction[0, 1], junctionRadius[0]);

var ruralJunctionCnt = JUNCTION_RURAL_MINIMUM + irandom(JUNCTION_RURAL_MAXIMUM - JUNCTION_RURAL_MINIMUM);
for (var i = 0; i < ruralJunctionCnt; i += 1) {
    junctionRadius[i + 1] = JUNCTION_MINIMUM_RADIUS + irandom(JUNCTION_MAXIMUM_RADIUS - JUNCTION_MINIMUM_RADIUS);
    while (true) {
        junction[i + 1, 0] = junctionRadius[i + 1] + irandom(TILE_COUNT_HORIZONTAL - 2 * (junctionRadius[i + 1]));
        junction[i + 1, 1] = junctionRadius[i + 1] + irandom(TILE_COUNT_VERTICAL - 2 * (junctionRadius[i + 1]));
        var posAvailable = true;
        for (var j = 0; j < i + 1; j += 1) {
            var xDiff = junction[i + 1, 0] - junction[j, 0];
            var yDiff = junction[i + 1, 1] - junction[j, 1];
            if (sqr(xDiff) + sqr(yDiff) < sqr(JUNCTION_MAXIMUM_RADIUS * 2))
                posAvailable = false;
        }
        if (posAvailable) break;
    }
    PlaceJunctionInclusion(junction[i + 1, 0], junction[i + 1, 1], junctionRadius[i + 1]);
}

// Set Roads
var hasRoad;
var totalJunctionCnt = ruralJunctionCnt + 1;
for (var i = 0; i < totalJunctionCnt; i += 1) {
    for (var j = 0; j < totalJunctionCnt; j += 1) {
        if (i != j) hasRoad[i, j] = 0;
        else        hasRoad[i, j] = 1;
    }
}

while(true) {
    junctionFrom = irandom(totalJunctionCnt - 1);
    junctionTo = irandom(totalJunctionCnt - 1);
    if (hasRoad[junctionFrom, junctionTo]) continue;
    if (!CanConnectRoad(junctionFrom, junctionTo, totalJunctionCnt)) continue;
    
    ConnectRoad(junctionFrom, junctionTo);
    hasRoad[junctionFrom, junctionTo] = 1;
    
    var allRoadsConnected = 1;
    for (var i = 0; i < totalJunctionCnt; i += 1) {
        var hasRoadConnected = 0;
        for (var j = 0; j < totalJunctionCnt; j += 1) {
            if (i != j) hasRoadConnected = hasRoadConnected | hasRoad[i, j];
        }
        allRoadsConnected = allRoadsConnected & hasRoadConnected;
    }
    if (allRoadsConnected) break;
}
