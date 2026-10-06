draw_set_color(c_white);

// Verifica se a variável existe antes de desenhar
if (variable_instance_exists(id, "total_inimigos")) {
    draw_text(20, 20, "Inimigos restantes: " + string(total_inimigos));
} else {
    // Caso ainda não tenha sido criada no frame atual
    total_inimigos = instance_number(obj_enemy_parent);
    draw_text(20, 20, "Inimigos restantes: " + string(total_inimigos));
}