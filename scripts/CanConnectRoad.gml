//
// ** Function dedicated to TileRenderer **
//

var from = argument0;
var to = argument1;
var totalJunctionCnt = argument2;

var x2 = junction[from, 0];
var y2 = junction[from, 1];
var x3 = junction[to, 0];
var y3 = junction[to, 1];
var p = PAVEMENT_MAXIMUM_WIDTH;
var INT_MAX = 2147483647;

var canConnect = true;
for (var i = 0; i < totalJunctionCnt; i += 1) {
    if (i == from || i == to) continue;
    var x1 = junction[i, 0];
    var y1 = junction[i, 1];
    var r = junctionRadius[i];
    
    var g;
    if (x2 == x3) g = INT_MAX;
    else g = (y3 - y2) / (x3 - x2);
    
    var xc = (x1 + sqr(g) * x2 + g * (y1 - y2)) / (sqr(g) + 1);
    var yc = g * (xc - x2) + y2;
    var distSqr = sqr(x1 - xc) + sqr(y1 - yc);
    if (distSqr <= sqr(r + p)) {
        canConnect = false;
        break;
    }
}
return canConnect;
