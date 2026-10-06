function init_global_inputs() {
    if (!variable_global_exists("input_parry")) global.input_parry = false;
    if (!variable_global_exists("input_ataque")) global.input_ataque = false;
    if (!variable_global_exists("input_dash")) global.input_dash = false;
    if (!variable_global_exists("input_cima")) global.input_cima = false;
    if (!variable_global_exists("input_baixo")) global.input_baixo = false;
    if (!variable_global_exists("input_esquerda")) global.input_esquerda = false;
    if (!variable_global_exists("input_direita")) global.input_direita = false;
    if (!variable_global_exists("control_scheme")) global.control_scheme = "keyboard";
    if (!variable_global_exists("gamepad_id")) global.gamepad_id = -1;
    global.input_initialized = true;
}

function gamepad_family(_gamepad) {
    var _description = string_lower(gamepad_get_description(_gamepad));

    if (string_pos("playstation", _description) > 0
        || string_pos("dualshock", _description) > 0
        || string_pos("dualsense", _description) > 0
        || string_pos("sony", _description) > 0) {
        return "playstation";
    }

    if (string_pos("xbox", _description) > 0
        || string_pos("xinput", _description) > 0) {
        return "xbox";
    }

    return "generic";
}

function find_gamepad_for_scheme(_scheme) {
    var _count = gamepad_get_device_count();
    var _generic = -1;

    for (var _device = 0; _device < _count; _device++) {
        if (!gamepad_is_connected(_device)) continue;

        var _family = gamepad_family(_device);
        if (_family == _scheme) return _device;
        if (_family == "generic") _generic = _device;
    }

    return _generic;
}

function update_global_inputs() {
    init_global_inputs();

    global.input_parry = false;
    global.input_ataque = false;
    global.input_dash = false;
    global.input_cima = false;
    global.input_baixo = false;
    global.input_esquerda = false;
    global.input_direita = false;

    var _gp = global.gamepad_id;
    var _gamepad_active = global.control_scheme != "keyboard"
        && _gp >= 0
        && _gp < gamepad_get_device_count()
        && gamepad_is_connected(_gp);

    if (_gamepad_active) {
        global.input_cima = gamepad_button_check(_gp, gp_dpad_up)
            || gamepad_axis_value(_gp, gp_axisv) < -0.2;
        global.input_baixo = gamepad_button_check(_gp, gp_dpad_down)
            || gamepad_axis_value(_gp, gp_axisv) > 0.2;
        global.input_esquerda = gamepad_button_check(_gp, gp_dpad_left)
            || gamepad_axis_value(_gp, gp_axislh) < -0.2;
        global.input_direita = gamepad_button_check(_gp, gp_dpad_right)
            || gamepad_axis_value(_gp, gp_axislh) > 0.2;

        global.input_ataque = gamepad_button_check(_gp, gp_face1);
        global.input_parry = gamepad_button_check_pressed(_gp, gp_face2);
        global.input_dash = gamepad_button_check_pressed(_gp, gp_face3);
    } else {
        global.input_cima = keyboard_check(ord("W"));
        global.input_baixo = keyboard_check(ord("S"));
        global.input_esquerda = keyboard_check(ord("A"));
        global.input_direita = keyboard_check(ord("D"));
        global.input_ataque = keyboard_check(ord("P"));
        global.input_parry = keyboard_check_pressed(ord("O"));
        global.input_dash = keyboard_check_pressed(vk_shift);
    }
}
