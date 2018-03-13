if (object_is_ancestor(attackTarget.object_index, Barricade)) {
    attackCount += 1;
    if (attackCount % room_speed == 0) {
        DamageBarricade(attackTarget);
    }
}
