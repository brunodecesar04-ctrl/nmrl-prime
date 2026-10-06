// Evento Room Start do obj_player

// Verifica se existem coordenadas salvas
if (variable_global_exists("player_start_x") && global.player_start_x != undefined) {
    // Reposiciona o jogador na coordenada exata passada pela porta
    x = global.player_start_x;
    y = global.player_start_y;
}