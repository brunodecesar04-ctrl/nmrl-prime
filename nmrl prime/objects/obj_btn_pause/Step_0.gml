// ==========================================
// ESC - ABRIR / FECHAR PAUSE
// ==========================================

if (instance_exists(obj_run))
{
    if (obj_run.run_ativa)
    {
        if (keyboard_check_pressed(vk_escape))
        {
            // ==================================
            // SE ESTÁ PAUSADO → CONTINUA
            // ==================================

            if (global.jogo_pausado)
            {
                global.jogo_pausado = false;
                obj_run.run_pausada = false;
            }

            // ==================================
            // SE NÃO ESTÁ PAUSADO → PAUSA
            // ==================================

            else
            {
                global.jogo_pausado = true;
                obj_run.run_pausada = true;
                obj_run.pause_room = room;
            }
        }
    }
}


// ==========================================
// BOTÃO DE PAUSE COM MOUSE
// ==========================================

if (instance_exists(obj_run))
{
    if (obj_run.run_ativa && !global.jogo_pausado)
    {
        var _x = display_get_gui_width() / 2.1;
        var _y = 2;

        var _mx = device_mouse_x_to_gui(0);
        var _my = device_mouse_y_to_gui(0);

        if (mouse_check_button_pressed(mb_left))
        {
            if (point_in_rectangle(
                _mx,
                _my,
                _x - 40,
                _y - 40,
                _x + 40,
                _y + 40
            ))
            {
                global.jogo_pausado = true;
                obj_run.run_pausada = true;
                obj_run.pause_room = room;
            }
        }
    }
}