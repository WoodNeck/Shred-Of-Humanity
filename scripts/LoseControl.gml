if (state != WolfState.CONTROL) exit;
if (irandom(1) == 0) {
    audio_play_sound(GrowlSnd, 1, false);
} else {
    audio_play_sound(GrowlSnd2, 1, false);
}if (irandom(1) == 0) {
    audio_play_sound(GrowlSnd, 1, false);
} else {
    audio_play_sound(GrowlSnd2, 1, false);
}
humanityCooldown = 0.5;
ChooseNextVictim();
