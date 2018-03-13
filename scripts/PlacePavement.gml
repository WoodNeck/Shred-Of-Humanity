//
// ** Function dedicated to TileRenderer **
//


var posX = argument0;
var posY = argument1;
var type = argument2;

var previousType = paveType[posX, posY];
if (previousType == Pavement.LARGE) exit;

paveType[posX, posY] = type;
if (type == Pavement.LARGE)
    paveIndex[posX, posY] = irandom(PAVEMENT_LARGE_CNT - 1);
else
    paveIndex[posX, posY] = PAVEMENT_LARGE_CNT + irandom(PAVEMENT_SMALL_CNT - 1);
