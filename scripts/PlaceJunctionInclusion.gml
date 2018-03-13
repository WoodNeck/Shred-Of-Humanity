//
// ** Function dedicated to TileRenderer **
//

var junctionX = argument0;
var junctionY = argument1;
var radius = argument2;

// 원의 8분의 1만큼만 계산한 다음 원 전체에 대해 적용 
for (var i = 0; i < ceil(radius * 0.707); i += 1) {
    var cntToApply = ceil(sqrt(sqr(radius) - sqr(i)));
    for (var j = 0; j < cntToApply; j += 1) {
        if (j == cntToApply - 1) {
            PlacePavement(junctionX + i, junctionY + j, Pavement.SMALL);
            PlacePavement(junctionX + i, junctionY - j, Pavement.SMALL);
            PlacePavement(junctionX - i, junctionY + j, Pavement.SMALL);
            PlacePavement(junctionX - i, junctionY - j, Pavement.SMALL);
            
            PlacePavement(junctionX + j, junctionY + i, Pavement.SMALL);
            PlacePavement(junctionX + j, junctionY - i, Pavement.SMALL);
            PlacePavement(junctionX - j, junctionY + i, Pavement.SMALL);
            PlacePavement(junctionX - j, junctionY - i, Pavement.SMALL);
            
        } else {
            PlacePavement(junctionX + i, junctionY + j, Pavement.LARGE);
            PlacePavement(junctionX + i, junctionY - j, Pavement.LARGE);
            PlacePavement(junctionX - i, junctionY + j, Pavement.LARGE);
            PlacePavement(junctionX - i, junctionY - j, Pavement.LARGE);
            
            PlacePavement(junctionX + j, junctionY + i, Pavement.LARGE);
            PlacePavement(junctionX + j, junctionY - i, Pavement.LARGE);
            PlacePavement(junctionX - j, junctionY + i, Pavement.LARGE);
            PlacePavement(junctionX - j, junctionY - i, Pavement.LARGE);
        }
    }
}
