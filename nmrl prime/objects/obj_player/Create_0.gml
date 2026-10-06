// --- ATRIBUTOS DE MOVIMENTO ---
init_global_inputs();

vel = 2.5;
vel_h = 0;
vel_l = 0;
ultima_direcao = "baixo";

// --- DANO E INVULNERABILIDADE ---
hp_max = 100;
hp = hp_max;
tempo_regeneracao = 0;
hp_anterior = hp;
posso_tomar_dano = true;
tempo_invencivel = game_get_speed(gamespeed_fps) * 1;
defesa = 0;
esta_morto = false;

// --- SISTEMA DE PARRY ---
parry_ativo = false;
parry_timer = 0;
parry_window = 6; // 100ms (~6 frames a 60fps)
parry_direction = "direita";
parry_xscale = 1;
parry_yscale = 1;

// --- KNOCKBACK ---
empurrao_h = 0;
empurrao_v = 0;

// --- ANIMAÇÃO CARTOON (Squash & Stretch) ---
xscale_alvo = 1;
yscale_alvo = 1;
xscale_atual = 1;
yscale_atual = 1;

// --- CONFIGURAÇÃO de DASH ---
vel_dash = 9;
tempo_dash = 14;
timer_dash = 0;
cooldown_dash = 30;
timer_cooldown = 0;
dash_dir = 0;

// --- CONTROLE DE ÁUDIO ---
indice_som_ataque = 0;

// --- COMBATE E GUI ---
pode_atacar = true;
tempo_cooldown_ataque = 10;
dano = 10;

gui_largura = display_get_gui_width();
gui_altura = display_get_gui_height();
skill_btn_x = gui_largura - 80;
skill_btn_y = gui_altura - 80;
skill_btn_raio = 32;

// --- MÁQUINA de ESTADOS ---
estado_livre = function() {
    if (timer_cooldown > 0) timer_cooldown--;

    var _dir   = global.input_direita;
    var _esq   = global.input_esquerda;
    var _baixo = global.input_baixo;
    var _cima  = global.input_cima;

    var _move_x = _dir - _esq;
    var _move_y = _baixo - _cima;

    vel_h = _move_x * vel;
    vel_l = _move_y * vel;

    if (vel_h > 0) ultima_direcao = "direita";
    if (vel_h < 0) ultima_direcao = "esquerda";
    if (vel_l > 0) ultima_direcao = "baixo";
    if (vel_l < 0) ultima_direcao = "cima";

    if (vel_h != 0 || vel_l != 0) {
        image_speed = 1;
        switch (ultima_direcao) {
            case "direita":  sprite_index = spr_andando_direita; break;
            case "esquerda": sprite_index = spr_andando_esquerda; break;
            case "cima":     sprite_index = spr_andando_costa; break;
            case "baixo":    sprite_index = spr_andando_frente; break;
        }
    } else {
        image_speed = 1;
        switch (ultima_direcao) {
            case "direita":  sprite_index = spr_parado_direita; break;
            case "esquerda": sprite_index = spr_parado_esquerda; break;
            case "cima":     sprite_index = spr_parado_costa; break;
            case "baixo":    sprite_index = spr_parado_frente; break;
        }
    }

    if (place_meeting(x + vel_h, y, obj_bloco)) {
        while (!place_meeting(x + sign(vel_h), y, obj_bloco)) {
            x += sign(vel_h);
        }
        vel_h = 0;
    }
    x += vel_h;

    if (place_meeting(x, y + vel_l, obj_bloco)) {
        while (!place_meeting(x, y + sign(vel_l), obj_bloco)) {
            y += sign(vel_l);
        }
        vel_l = 0;
    }
    y += vel_l;

    if (global.input_dash && timer_cooldown <= 0) {
        if (_move_x != 0 || _move_y != 0) {
            dash_dir = point_direction(0, 0, _move_x, _move_y);
        } else {
            switch (ultima_direcao) {
                case "direita":  dash_dir = 0;   break;
                case "cima":     dash_dir = 90;  break;
                case "esquerda": dash_dir = 180; break;
                case "baixo":    dash_dir = 270; break;
            }
        }

        if (dash_dir > 45 && dash_dir < 135) {
            sprite_index = spr_dashcosta;
            ultima_direcao = "cima";
            xscale_atual = 0.6; yscale_atual = 1.5;
        } else if (dash_dir >= 135 && dash_dir <= 225) {
            sprite_index = spr_dashesquerda;
            ultima_direcao = "esquerda";
            xscale_atual = 1.5; yscale_atual = 0.6;
        } else if (dash_dir > 225 && dash_dir < 315) {
            sprite_index = spr_dashfrente;
            ultima_direcao = "baixo";
            xscale_atual = 0.6; yscale_atual = 1.5;
        } else {
            sprite_index = spr_dashdireita;
            ultima_direcao = "direita";
            xscale_atual = 1.5; yscale_atual = 0.6;
        }

        image_index = 0;
        image_speed = 1;
        timer_dash = tempo_dash;
        timer_cooldown = cooldown_dash;
        posso_tomar_dano = false;
        estado_atual = estado_dash;
    }

    if (global.input_parry) {
        // Efeito Visual de Esticada (Squash & Stretch)
        // No parry, ele "estica" verticalmente e achata horizontalmente
        xscale_alvo = 0.7;
        yscale_alvo = 1.3;

        // Define a janela de parry
        parry_ativo = true;
        parry_timer = parry_window;

        // Define a direção baseada no movimento ou última direção
        var _move_x = global.input_direita - global.input_esquerda;
        var _move_y = global.input_baixo - global.input_cima;

        if (_move_x != 0 || _move_y != 0) {
            if (abs(_move_x) > abs(_move_y)) {
                parry_direction = (_move_x > 0) ? "direita" : "esquerda";
            } else {
                parry_direction = (_move_y > 0) ? "baixo" : "cima";
            }
        } else {
            parry_direction = ultima_direcao;
        }

        // Trigger visual imediato para a esticada
        parry_xscale = 0.7;
        parry_yscale = 1.3;
    }

    if (global.input_ataque) {
        image_index = 0;
        image_speed = 1;
        estado_atual = estado_ataque;
    }
};

estado_dash = function() {
    var _anim_speed = sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
    image_index += _anim_speed;

    var _vx = lengthdir_x(vel_dash, dash_dir);
    var _vy = lengthdir_y(vel_dash, dash_dir);

    if (!place_meeting(x + _vx, y, obj_bloco)) {
        x += _vx;
    } else {
        while (!place_meeting(x + sign(_vx), y, obj_bloco)) {
            x += sign(_vx);
        }
    }

    if (!place_meeting(x, y + _vy, obj_bloco)) {
        y += _vy;
    } else {
        while (!place_meeting(x, y + sign(_vy), obj_bloco)) {
            y += sign(_vy);
        }
    }

    timer_dash--;

    if (timer_dash <= 0) {
        posso_tomar_dano = true;
        estado_atual = estado_livre;
    }
};

estado_ataque = function() {
    vel_h = 0;
    vel_l = 0;
    image_speed = 1;

    switch (ultima_direcao) {
        case "direita":  sprite_index = spr_ataque_direita;  break;
        case "esquerda": sprite_index = spr_ataque_esquerda; break;
        case "cima":     sprite_index = spr_ataque_costa;    break;
        case "baixo":    sprite_index = spr_ataque_frente;   break;
    }

    if (!instance_exists(obj_ataqueplayer)) {
        var _off_x = 0; var _off_y = 0; var _angulo = 0; var _distancia = 24;
        switch (ultima_direcao) {
            case "direita":  _off_x =  _distancia; _angulo = 0;   break;
            case "esquerda": _off_x = -_distancia; _angulo = 180; break;
            case "cima":     _off_y = -_distancia; _angulo = 90;  break;
            case "baixo":    _off_y =  _distancia; _angulo = 270; break;
        }
       var _slash = instance_create_layer(x + _off_x, y + _off_y, layer, obj_ataqueplayer);
        _slash.image_angle = _angulo;
        _slash.direcao_ataque = ultima_direcao;
        _slash.dono = id;

       switch (indice_som_ataque) {
    case 0:
        audio_sound_gain(mp3_snd_knight_sword_swing_01, obj_config.volume_ataque, 0);
        audio_play_sound(mp3_snd_knight_sword_swing_01, 1, false);
        break;

    case 1:
        audio_sound_gain(mp3_snd_knight_sword_swing_02, obj_config.volume_ataque, 0);
        audio_play_sound(mp3_snd_knight_sword_swing_02, 1, false);
        break;

    case 2:
        audio_sound_gain(mp3_snd_knight_sword_swing_03, obj_config.volume_ataque, 0);
        audio_play_sound(mp3_snd_knight_sword_swing_03, 1, false);
        break;
}
        indice_som_ataque = (indice_som_ataque + 1) % 3;
    }

    if (image_index >= image_number - 1) {
        image_index = 0;
        estado_atual = estado_livre;
    }
};

estado_atual = estado_livre;
