if (victim != noone && victim.object_index == Meat) return victim;

var possibleVictim = victim;
var meatNum = instance_number(Meat);
for (var i = 0; i < meatNum; i += 1) {
    var meat = instance_find(Meat, i);
    var dist = floor(abs(meat.x - x) / TILE_WIDTH) + floor(abs(meat.y - y) / TILE_HEIGHT);
    if (dist <= MEAT_AFFECT_RANGE) {
        possibleVictim = meat;
    }
}

if (possibleVictim == noone) {
    if (instance_exists(Civilian)) {
        possibleVictim = instance_find(Civilian, 0);
        with (Civilian) {
            if (sqr(x - other.x) + sqr(y - other.y) < sqr(possibleVictim.x - other.x) + sqr(possibleVictim.y - other.y)) {
                possibleVictim = self;
            }
        }
    }
}

return possibleVictim;
