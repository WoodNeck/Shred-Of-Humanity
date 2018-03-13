var nextState = argument0;
state = nextState;
if (nextState == WolfState.ATTACK) {
    animIndex = 0;
} else if (nextState == WolfState.JUMP) {
    jumpHeight = 0;
    jumpTime = 0;
    jumpPosX = x;
    jumpPosY = y;
} else if (nextState = WolfState.CONTROL) {
    victim = noone;
}
