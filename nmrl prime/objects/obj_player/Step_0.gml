init_global_inputs();

// ==========================================
// VISIBILIDADE DO PLAYER
// ==========================================

if (room == rm_menuinicial ||
    room == rm_opcoes ||
    room == rm_volumes)
{
    visible = false;
}
else
{
    visible = true;
}


// ==========================================
// CONGELAMENTO DA GAMEPLAY
// ==========================================

if (instance_exists(obj_run))
{
    if (!obj_run.run_ativa || global.jogo_pausado)
    {
        exit;
    }
}
// 1. Executa a máquina de estados do Player
if (script_exists(asset_get_index(script_get_name(estado_atual)))) {
    estado_atual();
}
show_debug_message("[PLAYER] Estado atual: " + script_get_name(estado_atual));

// 2. Movimentação e Fricção de Knockback
if (abs(empurrao_h) > 0.05 || abs(empurrao_v) > 0.05) {

    // --- MOVIMENTAÇÃO HORIZONTAL ---
    if (!place_meeting(x + empurrao_h, y, obj_bloco)) {
        x += empurrao_h;
    } else {
        while (!place_meeting(x + sign(empurrao_h), y, obj_bloco)) {
            x += sign(empurrao_h);
        }
        empurrao_h = 0;
    }

    // --- MOVIMENTAÇÃO VERTICAL ---
    if (!place_meeting(x, y + empurrao_v, obj_bloco)) {
        y += empurrao_v;
    } else {
        while (!place_meeting(x, y + sign(empurrao_v), obj_bloco)) {
            y += sign(empurrao_v);
        }
        empurrao_v = 0;
    }

    // Fricção para suavizar a parada
    empurrao_h = lerp(empurrao_h, 0, 0.15);
    empurrao_v = lerp(empurrao_v, 0, 0.15);

    // Encerra a força residual
    if (abs(empurrao_h) <= 0.05 && abs(empurrao_v) <= 0.05) {
        empurrao_h = 0;
        empurrao_v = 0;
        show_debug_message("[KNOCKBACK FIM] Player parou totalmente.");
    }
}

// 3. Transição de Sala/Mapa
var _porta = instance_place(x, y, obj_transicao);

if (_porta != noone) {
    if (!_porta.locked && !instance_exists(obj_transition)) {
        show_debug_message("[TRANSIÇÃO] Entrando na sala: " + room_get_name(_porta.target_room));
        var _efeito = instance_create_depth(0, 0, -9999, obj_transition);
        _efeito.target_room = _porta.target_room;
        _efeito.target_x = _porta.target_x;
        _efeito.target_y = _porta.target_y;
    }
}

// 4. Retorno suave da animação Cartoon (Squash & Stretch)
// Interpolação do Parry (Efeito de esticada)
parry_xscale = lerp(parry_xscale, 1, 0.1);
parry_yscale = lerp(parry_yscale, 1, 0.1);

xscale_atual = lerp(xscale_atual, xscale_alvo, 0.1) * parry_xscale;
yscale_atual = lerp(yscale_atual, yscale_alvo, 0.1) * parry_yscale;

// Aplica as escalas ao objeto
image_xscale = xscale_atual;
image_yscale = yscale_atual;


// Detecta quando o player tomou dano
if (hp < hp_anterior)
{
    tempo_regeneracao = room_speed * 5;
}

hp_anterior = hp;


// Regeneração de vida (5 HP por segundo)
if (!esta_morto && hp < hp_max)
{
    if (tempo_regeneracao > 0)
    {
        tempo_regeneracao--;
    }
    else
    {
        hp += 5 / game_get_speed(gamespeed_fps);

        if (hp > hp_max)
        {
            hp = hp_max;
        }
    }
}
