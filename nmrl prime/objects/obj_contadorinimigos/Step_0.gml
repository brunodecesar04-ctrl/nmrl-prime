// Conta quantos inimigos do tipo pai (e todos os seus filhos) estão na sala
total_inimigos = instance_number(obj_enemy_parent);

// Confirma que a batalha começou
if (total_inimigos > 0) {
    batalha_comecou = true;
}

// Quando todos os inimigos da sala morrerem
if (batalha_comecou && total_inimigos == 0) {
    script_destruir_bloqueador(obj_blockdoor);
    instance_destroy(); 
}