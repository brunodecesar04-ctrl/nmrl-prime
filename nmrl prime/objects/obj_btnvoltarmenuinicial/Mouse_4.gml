if (global.veio_do_pause)
{
    global.veio_do_pause = false;

    global.jogo_pausado = true;
    obj_run.run_pausada = true;

    room_goto(obj_run.pause_room);
}
else
{
    room_goto(rm_menuinicial);
}