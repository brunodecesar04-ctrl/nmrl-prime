// --- LÓGICA DE MOVIMENTAÇÃO E ESTADOS ---
var _dir_x = 0;
var _dir_y = 0;

if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);

    // KITING: Mantém distância do player
    if (_dist > distancia_kiting + 10) {
        // Aproxima-se lentamente
        _dir_x = lengthdir_x(vel, _dir);
        _dir_y = lengthdir_y(vel, _dir);
    } else if (_dist < distancia_kiting - 10) {
        // Afasta-se para manter a distância
        _dir_x = lengthdir_x(vel, _dir + 180);
        _dir_y = lengthdir_y(vel, _dir + 180);
    }

    // --- MÁQUINA DE ESTADOS ---
    switch (estado) {
        case "livre":
            sprite_index = (_dir_x != 0 || _dir_y != 0) ? spr_andando : spr_parado;

            // Inicia preparação do ataque se estiver em distância razoável
            if (_dist < 250 && timer_cooldown <= 0) {
                estado = "preparando";
                timer_preparacao = tempo_preparacao;
                sprite_index = spr_ataque;
                image_index = 0;
            }
            break;

        case "preparando":
            // Fica parado enquanto prepara o ataque
            _dir_x = 0;
            _dir_y = 0;
            timer_preparacao--;

            if (timer_preparacao <= 0) {
                // ATAQUE: Rola a pedra na direção do jogador
                var _dir_ataque = point_direction(x, y, obj_player.x, obj_player.y);
                var _pedra = instance_create_layer(x, y, layer, obj_pedra_kailo);
                _pedra.direction = _dir_ataque;
                _pedra.speed = 4;

                estado = "cooldown";
                timer_cooldown = cooldown_ataque;
                sprite_index = spr_parado;
            }
            break;

        case "cooldown":
            sprite_index = (_dir_x != 0 || _dir_y != 0) ? spr_andando : spr_parado;
            timer_cooldown--;
            if (timer_cooldown <= 0) {
                estado = "livre";
            }
            break;
    }
}

// Colisões básicas com blocos
if (!place_meeting(x + _dir_x, y, obj_bloco)) x += _dir_x;
if (!place_meeting(x, y + _dir_y, obj_bloco)) y += _dir_y;
