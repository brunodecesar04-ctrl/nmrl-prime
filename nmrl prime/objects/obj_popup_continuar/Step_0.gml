// ==========================================
// POSIÇÃO DO MOUSE NA GUI
// ==========================================

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


// ==========================================
// CLIQUES
// ==========================================

if (mouse_check_button_pressed(mb_left))
{
    // ======================================
    // CONTINUAR
    // ======================================

    if (point_in_rectangle(
        _mx,
        _my,

        popup_x + 100,
        popup_y + 140,

        popup_x + 500,
        popup_y + 190
    ))
    {
        // Lê o save novamente antes de carregar
        obj_run.ler_save();


        // Recupera o tempo
        obj_run.tempo_run =
            obj_run.save_tempo;


        obj_run.run_ativa = true;

        obj_run.run_pausada = false;


        global.jogo_pausado = false;


        // Diz ao obj_run para restaurar
        // posição e vida
        obj_run.carregar_save = true;


        // Vai para a Room salva
        room_goto(obj_run.save_room);


        instance_destroy();

        exit;
    }


    // ======================================
    // NOVO JOGO
    // ======================================

    if (point_in_rectangle(
        _mx,
        _my,

        popup_x + 100,
        popup_y + 210,

        popup_x + 500,
        popup_y + 260
    ))
    {
        // Apaga completamente a run anterior
        obj_run.apagar_run();


        // Nova run
        obj_run.tempo_run = 0;

        obj_run.run_ativa = true;

        obj_run.run_pausada = false;


        global.jogo_pausado = false;


        // Primeira Room
        room_goto(rm_lobby1);


        instance_destroy();

        exit;
    }


    // ======================================
    // X
    // ======================================

    if (point_in_rectangle(
        _mx,
        _my,

        popup_x + popup_largura - 55,
        popup_y + 5,

        popup_x + popup_largura - 5,
        popup_y + 55
    ))
    {
        // Apenas fecha o popup.
        // NÃO apaga o save.
        instance_destroy();

        exit;
    }
}