/// @function scr_save_system()
/// Gerencia a persistência de dados do jogo.

function game_save() {
    var _save_data = {
        nivel: global.nivel_jogador,
        xp: global.xp_atual,
        xp_next: global.xp_para_proximo_nivel,
        moedas: global.moedas_jogador,
        tempo: global.tempo_speedrun,
        usuario: global.usuario_logado
    };

    var _json = json_stringify(_save_data);
    var _file = file_text_open_write("savegame.dat");
    file_text_write_string(_file, _json);
    file_text_close(_file);
    show_debug_message("Jogo Salvo com Sucesso!");
}

function global_carregar_jogo_save() {
    if (file_exists("savegame.dat")) {
        var _file = file_text_open_read("savegame.dat");
        var _json = file_text_read_string(_file);
        file_text_close(_file);

        var _data = json_parse(_json);

        if (variable_struct_exists(_data, "nivel")) global.nivel_jogador = _data.nivel;
        if (variable_struct_exists(_data, "xp")) global.xp_atual = _data.xp;
        if (variable_struct_exists(_data, "xp_next")) global.xp_para_proximo_nivel = _data.xp_next;
        if (variable_struct_exists(_data, "moedas")) global.moedas_jogador = _data.moedas;
        if (variable_struct_exists(_data, "tempo")) global.tempo_speedrun = _data.tempo;
        if (variable_struct_exists(_data, "usuario")) global.usuario_logado = _data.usuario;

        if (instance_exists(obj_player)) {
            obj_player.hp_max = 100 + (global.nivel_jogador * 20);
            obj_player.hp = obj_player.hp_max;
            obj_player.dano = 10 + (global.nivel_jogador * 2);
            obj_player.defesa = global.nivel_jogador;
        }
        show_debug_message("Jogo Carregado com Sucesso!");
    } else {
        show_debug_message("Nenhum arquivo de save encontrado.");
    }
}
