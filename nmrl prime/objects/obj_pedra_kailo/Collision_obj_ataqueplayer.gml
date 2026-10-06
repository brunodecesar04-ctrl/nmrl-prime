// --- DESTRUIÇÃO DA PEDRA PELO PLAYER ---

// 1. Reseta a rotação para 0 graus IMEDIATAMENTE
image_angle = 0;

// 2. Marca que está sendo destruída para o Step processar a remoção
está_sendo_destruida = true;
pode_causar_dano = false;

// 3. Feedback visual (frame de destruição)
image_index = 2;
image_speed = 0;

// 4. Destrói a instância após um pequeno delay (via alarm ou imediato)
alarm[0] = 5;
