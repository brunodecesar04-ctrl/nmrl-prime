/// @function scr_game_systems()
/// Centraliza toda a lógica de RPG: XP, Level, Economia e Atributos.

// --- CONFIGURAÇÕES GLOBAIS DE PROGRESSÃO ---
global.xp_para_proximo_nivel = 100;
global.xp_atual = 0;
global.nivel_jogador = 1;

global.moedas_jogador = 0;
global.tempo_speedrun = 0;
global.speedrun_ativo = false;

// --- FUNÇÕES DE PROGRESSÃO ---

/// @function ganhar_xp(quantidade)
function ganhar_xp(_qtd) {
    global.xp_atual += _qtd;
    show_debug_message("Ganhou " + string(_qtd) + " XP. Total: " + string(global.xp_atual));

    while (global.xp_atual >= global.xp_para_proximo_nivel) {
        global.xp_atual -= global.xp_para_proximo_nivel;
        global.nivel_jogador++;

        global.xp_para_proximo_nivel = floor(global.xp_para_proximo_nivel * 1.2);

        if (instance_exists(obj_player)) {
            obj_player.hp_max += 20;
            obj_player.hp = obj_player.hp_max;
            obj_player.dano += 2;
            obj_player.defesa += 1;
        }

        show_debug_message("SUBIU DE NÍVEL! Agora nível: " + string(global.nivel_jogador));
    }
}

/// @function calcular_recompensa_inimigo(inimigo_inst)
function calcular_recompensa_inimigo(_inst) {
    var _lvl = _inst.nivel;
    var _esp = _inst.especie;

    var _mult_xp = 1;
    var _mult_gold = 1;

    // Multiplicador por Espécie
    switch(_esp) {
        case "comum": _mult_xp = 1;    _mult_gold = 1;    break;
        case "elite": _mult_xp = 2;    _mult_gold = 2.5;  break;
        case "raro":  _mult_xp = 5;    _mult_gold = 5;    break;
        case "boss":  _mult_xp = 20;   _mult_gold = 15;   break;
    }

    var _xp_ganho = floor(_lvl * 20 * _mult_xp);
    var _moedas_ganhas = floor(random(5) + (5 * _lvl * _mult_gold));

    ganhar_xp(_xp_ganho);
    global.moedas_jogador += _moedas_ganhas;

    show_debug_message("Drop de " + _esp + " Lvl " + string(_lvl) + ": " + string(_xp_ganho) + " XP e " + string(_moedas_ganhas) + " G");
}

/// @function formatar_tempo_speedrun(segundos)
function scr_formatar_tempo_speedrun(_seg) {
    var _min = floor(_seg / 60);
    var _sec = floor(_seg % 60);
    var _ms = floor((_seg * 100) % 100);
    return string_format(_min, 2, 0) + ":" + string_format(_sec, 2, 0) + ":" + string_format(_ms, 2, 0);
}
