function init_global_inputs() {
    if (!variable_global_exists("input_parry")) global.input_parry = false;
    if (!variable_global_exists("input_ataque")) global.input_ataque = false;
    if (!variable_global_exists("input_dash")) global.input_dash = false;
    if (!variable_global_exists("input_cima")) global.input_cima = false;
    if (!variable_global_exists("input_baixo")) global.input_baixo = false;
    if (!variable_global_exists("input_esquerda")) global.input_esquerda = false;
    if (!variable_global_exists("input_direita")) global.input_direita = false;
    global.input_initialized = true;
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

    global.input_cima = keyboard_check(ord("W"));
    global.input_baixo = keyboard_check(ord("S"));
    global.input_esquerda = keyboard_check(ord("A"));
    global.input_direita = keyboard_check(ord("D"));
    global.input_ataque = keyboard_check(ord("P"));
    global.input_parry = keyboard_check_pressed(ord("O"));
    global.input_dash = keyboard_check_pressed(vk_shift);
}
