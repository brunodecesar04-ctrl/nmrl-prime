// ==========================================
// CRONÔMETRO DA SPEEDRUN
// ==========================================

if (run_ativa && !run_pausada)
{
    tempo_run += delta_time / 1000000;
}


// ==========================================
// CARREGAR PARTIDA SALVA
// ==========================================

if (carregar_save)
{
    // Espera chegar na Room salva
    if (room == save_room)
    {
        if (instance_exists(obj_player))
        {
            // Restaura os dados
            obj_player.x = save_x;
            obj_player.y = save_y;
            obj_player.hp = save_hp;

            obj_player.visible = true;

            carregar_save = false;
        }
        else
        {
            // Caso o jogo tenha sido fechado,
            // o player persistente não existe mais.

            var _player = instance_create_depth(
                save_x,
                save_y,
                0,
                obj_player
            );

            _player.hp = save_hp;
            _player.visible = true;

            carregar_save = false;
        }
    }
}


// ==========================================
// VOLTAR DAS OPÇÕES PARA A GAMEPLAY
// ==========================================

if (voltando_do_pause)
{
    if (room == pause_room)
    {
        if (instance_exists(obj_player))
        {
            obj_player.x = pause_x;
            obj_player.y = pause_y;
            obj_player.hp = pause_hp;

            obj_player.visible = true;

            global.jogo_pausado = true;

            run_pausada = true;

            voltando_do_pause = false;
        }
    }
}