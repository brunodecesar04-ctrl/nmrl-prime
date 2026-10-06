// 1. Se a animação NORMAL terminou (tela totalmente coberta/fechada)
if (estado == 1) {
    
    // Mover o jogador para a nova posição
    if (instance_exists(obj_player)) {
        obj_player.x = target_x;
        obj_player.y = target_y;
    }
    
    // Troca de sala
    room_goto(target_room);
    
    // Inverte a animação para rodar ao reverso
    estado = -1;
    image_speed = -1;
};