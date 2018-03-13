//
// ** Function dedicated to TileRenderer **
//

var from = argument0;
var to = argument1;

var junctionFromX = junction[from, 0];
var junctionFromY = junction[from, 1];
var junctionToX   = junction[to, 0];
var junctionToY   = junction[to, 1];

var paveWidth = PAVEMENT_MINIMUM_WIDTH + irandom(PAVEMENT_MAXIMUM_WIDTH - PAVEMENT_MINIMUM_WIDTH);
var paveUpper = ceil((paveWidth - 1) / 2);
var paveLower = floor((paveWidth - 1) / 2);
var gradient = (junctionToY - junctionFromY) / (junctionToX - junctionFromX);

if (abs(gradient) < 1) {
    var xFrom = min(junctionFromX, junctionToX);
    var xTo = max(junctionFromX, junctionToX);
    for (var i = xFrom; i < xTo; i += 1) {
        var roadY = ceil(gradient * (i - junctionFromX) + junctionFromY);
        PlacePavement(i, roadY, Pavement.LARGE);
        for (var j = 1; j < paveUpper + 1; j += 1) {
            if (j == paveUpper) {
                PlacePavement(i, roadY - j, Pavement.SMALL);
            } else {
                PlacePavement(i, roadY - j, Pavement.LARGE);
            }
        }
        for (var j = 1; j < paveLower + 1; j += 1) {
            if (j == paveLower) {
                PlacePavement(i, roadY + j, Pavement.SMALL);
            } else {
                PlacePavement(i, roadY + j, Pavement.LARGE);
            }
        }
    }
} else {
    var yFrom = min(junctionFromY, junctionToY);
    var yTo = max(junctionFromY, junctionToY);
    for (var i = yFrom; i < yTo; i += 1) {
        var roadX = floor((1 / gradient) * (i - junctionFromY) + junctionFromX);
        PlacePavement(roadX, i, Pavement.LARGE);
        for (var j = 1; j < paveUpper + 1; j += 1) {
            if (j == paveUpper) {
                PlacePavement(roadX - j, i, Pavement.SMALL);
            } else {
                PlacePavement(roadX - j, i, Pavement.LARGE);
            }
        }
        for (var j = 1; j < paveLower + 1; j += 1) {
            if (j == paveLower) {
                PlacePavement(roadX + j, i, Pavement.SMALL);
            } else {
                PlacePavement(roadX + j, i, Pavement.LARGE);
            }
        }
    }
}
