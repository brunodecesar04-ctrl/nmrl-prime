if (room == rm_menuinicial
|| room == rm_opcoes || room == rm_volumes)
{
    if (!audio_is_playing(snd_menu))
    {
        audio_play_sound(snd_menu, 10, true);
    }
}
else
{
    if (audio_is_playing(snd_menu))
    {
        audio_stop_sound(snd_menu);
    }
}