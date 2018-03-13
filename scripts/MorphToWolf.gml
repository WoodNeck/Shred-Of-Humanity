moveSpeed = 0;
sprite_index = morphSprite;
inventory.state = HUDState.CLOSING;
wolfBar.state = HUDState.OPENING;
timeHUD.state = TimeState.NIGHT;
timeHUD.currentTime = 0;
audio_stop_sound(timeHUD.currentSong);
timeHUD.currentSong = audio_play_sound(timeHUD.nightSong, 0, true);
animIndex = -0.35;
alarm[0] = 10 / 7 * room_speed * sprite_get_number(morphSprite) / 15;

with (Civilian) {
    if (state == CharState.IDLE) state = CharState.PANIC;
}
