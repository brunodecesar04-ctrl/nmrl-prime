if (room == rm_controles) {
    var _gamepad_count = gamepad_get_device_count();
    var _navigate_left = keyboard_check_pressed(vk_left)
        || keyboard_check_pressed(ord("A"));
    var _navigate_right = keyboard_check_pressed(vk_right)
        || keyboard_check_pressed(ord("D"));
    var _confirm = keyboard_check_pressed(vk_enter)
        || keyboard_check_pressed(vk_space);

    for (var _device = 0; _device < _gamepad_count; _device++) {
        if (!gamepad_is_connected(_device)) continue;
        _navigate_left = _navigate_left
            || gamepad_button_check_pressed(_device, gp_dpad_left);
        _navigate_right = _navigate_right
            || gamepad_button_check_pressed(_device, gp_dpad_right);
        _confirm = _confirm || gamepad_button_check_pressed(_device, gp_face1);
    }

    if (_navigate_left) selecao_controle = (selecao_controle + 2) mod 3;
    if (_navigate_right) selecao_controle = (selecao_controle + 1) mod 3;

    var _mouse_x = device_mouse_x_to_gui(0);
    var _mouse_y = device_mouse_y_to_gui(0);
    if (mouse_check_button_pressed(mb_left)
        && _mouse_y >= display_get_gui_height() * 0.5 + 10
        && _mouse_y <= display_get_gui_height() * 0.5 + 90) {
        var _left_edge = display_get_gui_width() * 0.5 - 330;
        for (var _option = 0; _option < 3; _option++) {
            var _card_left = _left_edge + _option * 220;
            if (_mouse_x >= _card_left && _mouse_x <= _card_left + 200) {
                selecao_controle = _option;
                _confirm = true;
                break;
            }
        }
    }

    if (_confirm) {
        if (selecao_controle == 0) {
            global.control_scheme = "keyboard";
            global.gamepad_id = -1;
            room_goto(rm_menuinicial);
        } else {
            var _scheme = (selecao_controle == 1) ? "xbox" : "playstation";
            var _selected_gamepad = find_gamepad_for_scheme(_scheme);

            if (_selected_gamepad >= 0) {
                global.control_scheme = _scheme;
                global.gamepad_id = _selected_gamepad;
                room_goto(rm_menuinicial);
            } else {
                selecao_aviso = "Conecte um controle compatível ou escolha Teclado.";
            }
        }
    }

    exit;
}

// Atualiza os inputs globais (Teclado/Gamepad)
update_global_inputs();

// --- CONTROLE DO FILTRO de DALTONISMO (F9) ---
if (keyboard_check_pressed(vk_f9)) {
    filtro_ativo++;
    if (filtro_ativo > 3) filtro_ativo = 0;

    switch (filtro_ativo) {
        case 0: filtro_nome = "Desativado"; break;
        case 1: filtro_nome = "Protanopia"; break;
        case 2: filtro_nome = "Deuteranopia"; break;
        case 3: filtro_nome = "Tritanopia"; break;
    }
    show_debug_message("Filtro de Daltonismo: " + filtro_nome);
}

// Checa se não há mais inimigos na sala
if (instance_number(obj_marino) == 0) {
    // Procura o bloco da porta e diz que ele não está mais bloqueado
    if (instance_exists(obj_blockdoor)) {
        obj_blockdoor.block = false;
    }
}