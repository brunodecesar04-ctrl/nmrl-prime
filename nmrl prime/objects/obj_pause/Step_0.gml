// ==========================================
// CONTROLE DOS BOTÕES DO PAUSE
// ==========================================

if (
    global.jogo_pausado &&
    room != rm_opcoes &&
    room != rm_volumes &&
    room != rm_menuinicial
)
{
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    if (mouse_check_button_pressed(mb_left))
    {
        // ==================================
        // CONTINUAR
        // ==================================

        if (point_in_rectangle(
            _mx,
            _my,
            botao_x,
            botao_continuar_y,
            botao_x + botao_largura,
            botao_continuar_y + botao_altura
        ))
        {
            global.jogo_pausado = false;
            obj_run.run_pausada = false;
        }


        // ==================================
        // OPÇÕES
        // ==================================

        else if (point_in_rectangle(
            _mx,
            _my,
            botao_x,
            botao_opcoes_y,
            botao_x + botao_largura,
            botao_opcoes_y + botao_altura
        ))
        {
            if (instance_exists(obj_player))
            {
                obj_run.pause_room = room;
                obj_run.pause_x = obj_player.x;
                obj_run.pause_y = obj_player.y;
                obj_run.pause_hp = obj_player.hp;
            }

            global.veio_do_pause = true;

            obj_run.run_pausada = true;
            global.jogo_pausado = true;

            room_goto(rm_opcoes);
        }


        // ==================================
        // MENU PRINCIPAL
        // ==================================

        else if (point_in_rectangle(
            _mx,
            _my,
            botao_x,
            botao_menu_y,
            botao_x + botao_largura,
            botao_menu_y + botao_altura
        ))
        {
            // A FUNÇÃO ESTÁ NO OBJ_RUN
            obj_run.salvar_run();

            global.jogo_pausado = false;

            obj_run.run_ativa = false;
            obj_run.run_pausada = false;

            global.veio_do_pause = false;

            room_goto(rm_menuinicial);
        }
    }
}