// --- LÓGICA DE MOVIMENTO E ROTAÇÃO ---

if (pode_causar_dano) {
    // Gira 360 graus continuamente enquanto se move
    image_angle += velocidade_rotacao;
} else {
    // Quando para ou é destruída, volta para 0 graus
    image_angle = 0;
}

// Se a pedra for destruída por ataque, a rotação deve resetar
if (esta_sendo_destruida) {
    image_angle = 0;
    instance_destroy();
}

// Destrói se sair da sala
if (x < -100 || x > room_width + 100 || y < -100 || y > room_height + 100) {
    instance_destroy();
}
