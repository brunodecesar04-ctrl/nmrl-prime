// Step Event do obj_restart

if (position_meeting(mouse_x, mouse_y, id)) {
    if (mouse_check_button_pressed(mb_left)) {

        // Limpa a posição guardada de portas anteriores
        global.player_start_x = undefined;
        global.player_start_y = undefined;

        // CARREGAR SAVE ANTES de reiniciar
        if (script_exists(asset_get_index("global_carregar_jogo_save"))) {
            global_carregar_jogo_save();
            show_debug_message("[RESTART] Progresso carregado do save.");
        }

        show_debug_message("[RESTART] Redirecionando para rm_lobby1...");
        room_goto(rm_lobby1);
    }
}
