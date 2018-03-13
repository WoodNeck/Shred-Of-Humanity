var target = argument0;

if (target.object_index == Civilian) {
    instance_create(target.x, target.y, BloodSplash);
    var corpse = instance_create(target.x, target.y, Corpse);
    var head = instance_create(target.x, target.y, Head);
    head.type = target.type;
    head.index = target.index;
    if (head.type <= CivilianType.WOMAN) {
        head.height = 38 - 5 + irandom(10);
    } else {
        head.height = 26 - 5 + irandom(10);
    }
    
    var randomVal = irandom(1);
    if (target.type % 2 == 0) {
        if (randomVal == 1) {
            audio_play_sound(MaleScreamSnd, 1, false);
        } else {
            audio_play_sound(MaleScreamSnd2, 1, false);
        }
    } else {
        if (randomVal == 1) {
            audio_play_sound(FemaleScreamSnd, 1, false);
        } else {
            audio_play_sound(FemaleScreamSnd2, 1, false);
        }
    }
    
    head.xSpeed = -5 + 10 * random(1);
    head.ySpeed = -5 + 10 * random(1);
    head.zSpeed = 5;
    instance_destroy(target);
    victim = corpse;
    kills += 1;
}

ChangeWolfState(WolfState.SCULPT);
alarm[0] = room_speed * 3;
