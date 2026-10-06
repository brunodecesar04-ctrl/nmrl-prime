// 1. Verificação de Morte
if (hp <= 0) {
    estado = ESTADO_MARINO.MORTO;
}

if (estado == ESTADO_MARINO.MORTO) {
    sprite_index = spr_marino_morto;
    speed = 0;
    exit;
}

sprite_index = spr_marino;

// 2. Transição para Modo Ofensivo (se o player existir e estiver perto)
if (instance_exists(obj_player)) {
    var dist_player = point_distance(x, y, obj_player.x, obj_player.y);
    
    // Se estiver patrulhando ou parado e o player chegar a menos de 200px
    if ((estado == ESTADO_MARINO.PATRULHA || estado == ESTADO_MARINO.PARADO) && dist_player < 200) {
        estado = ESTADO_MARINO.OFENSIVO_PREPARANDO;
        contador_animacao = 0;
        subimagem_anterior = image_index;
        speed = 0;
    }
}

// 3. Máquina de Estados
switch (estado) {
    
    case ESTADO_MARINO.PATRULHA:
        // Diminui o cronômetro para mudar de comportamento
        tempo_mudar_estado--;
        
        if (tempo_mudar_estado <= 0) {
            // Alterna aleatoriamente entre andar ou ficar parado descansando
            if (choose(true, false)) {
                dir_patrulha = random(360); // Escolhe uma direção aleatória em graus
                tempo_mudar_estado = irandom_range(60, 180); // Anda de 1 a 3 segundos (a 60 FPS)
            } else {
                estado = ESTADO_MARINO.PARADO;
                tempo_mudar_estado = irandom_range(40, 120); // Fica parado de 0.6 a 2 segundos
            }
        }
        
        // Calcula a velocidade nos eixos X e Y
        var _vx = lengthdir_x(vel_patrulha, dir_patrulha);
        var _vy = lengthdir_y(vel_patrulha, dir_patrulha);
        
        // --- COLISÃO HORIZONTAL COM OBJ_BLOCO ---
        if (place_meeting(x + _vx, y, obj_bloco)) {
            while (!place_meeting(x + sign(_vx), y, obj_bloco)) {
                x += sign(_vx);
            }
            _vx = 0;
            dir_patrulha = random(360); // Muda de direção se bater na parede
        }
        x += _vx;
        
        // --- COLISÃO VERTICAL COM OBJ_BLOCO ---
        if (place_meeting(x, y + _vy, obj_bloco)) {
            while (!place_meeting(x, y + sign(_vy), obj_bloco)) {
                y += sign(_vy);
            }
            _vy = 0;
            dir_patrulha = random(360); // Muda de direção se bater na parede
        }
        y += _vy;
        break;

    case ESTADO_MARINO.PARADO:
        speed = 0;
        tempo_mudar_estado--;
        
        // Volta a patrulhar quando o tempo de pausa acabar
        if (tempo_mudar_estado <= 0) {
            estado = ESTADO_MARINO.PATRULHA;
        }
        break;

    case ESTADO_MARINO.OFENSIVO_PREPARANDO:
        speed = 0;

        // Detecta quando a animação do Marino completa 1 ciclo
        if (image_index < subimagem_anterior) {
            contador_animacao += 1;
        }
        subimagem_anterior = image_index;

        // Executa o pulo após completar 2 ciclos
        if (contador_animacao >= 2) {
            var player_centro_x = obj_player.x;
            var player_centro_y = obj_player.y;

            // Pega o centro dinâmico caso a origem da sprite do player esteja nos pés
            if (variable_instance_exists(obj_player, "bbox_top")) {
                player_centro_x = (obj_player.bbox_left + obj_player.bbox_right) / 2;
                player_centro_y = (obj_player.bbox_top + obj_player.bbox_bottom) / 2;
            }

            var distancia_player = point_distance(x, y, player_centro_x, player_centro_y);
            var dir = point_direction(x, y, player_centro_x, player_centro_y);

            if (distancia_player <= distancia_max_pulo) {
                destino_x = player_centro_x;
                destino_y = player_centro_y;
            } else {
                destino_x = x + lengthdir_x(distancia_max_pulo, dir);
                destino_y = y + lengthdir_y(distancia_max_pulo, dir);
            }

            move_towards_point(destino_x, destino_y, velocidade_pulo);
            estado = ESTADO_MARINO.OFENSIVO_PULANDO;
        }
        break;

    case ESTADO_MARINO.OFENSIVO_PULANDO:
        // --- LÓGICA DE PARRY (100ms) ---
        if (instance_exists(obj_player)) {
            if (obj_player.parry_ativo && obj_player.parry_timer > 0) {
                var _dir_retorno = point_direction(obj_player.x, obj_player.y, x, y) + 180;
                speed = 0;
                var _push_dist = 60;
                var _push_vx = lengthdir_x(_push_dist, _dir_retorno);
                var _push_vy = lengthdir_y(_push_dist, _dir_retorno);
                x += _push_vx;
                y += _push_vy;
                estado = ESTADO_MARINO.COOLDOWN;
                alarm[0] = tempo_cooldown;
                obj_player.parry_xscale = 0.5;
                obj_player.parry_yscale = 1.5;
                show_debug_message("[PARRY] Marino refletido!");
            }
        }
        // Trata a colisão com obj_bloco durante o pulo para não atravessar paredes
        if (place_meeting(x + hspeed, y + vspeed, obj_bloco)) {
            speed = 0;
            estado = ESTADO_MARINO.COOLDOWN;
            alarm[0] = tempo_cooldown;
            break;
        }

        if (point_distance(x, y, destino_x, destino_y) <= velocidade_pulo) {
            x = destino_x;
            y = destino_y;
            speed = 0;

            estado = ESTADO_MARINO.COOLDOWN;
            alarm[0] = tempo_cooldown;
        }
        break;

    case ESTADO_MARINO.COOLDOWN:
        speed = 0;
        break;
}