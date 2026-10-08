// Atualiza os inputs globais do teclado
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