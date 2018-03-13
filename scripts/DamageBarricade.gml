var barricade = argument0;
barricade.hp -= 1;
with (barricade) {
    event_user(0);
}
if (barricade.hp <= 0) {
    ChangeWolfState(WolfState.RUN);
    attackTarget = noone;
    instance_destroy(barricade);
} else {
    barricade.shake = true;
    barricade.alarm[0] = 10;
}
