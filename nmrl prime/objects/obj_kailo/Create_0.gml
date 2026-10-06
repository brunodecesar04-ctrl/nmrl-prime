// --- ATRIBUTOS DE STATUS ---
hp = 50;
hp_max = 50;
esta_morto = false;

// --- MOVIMENTAÇÃO E KITING ---
vel = 2;
distancia_kiting = 120; // Distância que ele tenta manter do player
estado = "livre"; // "livre", "preparando", "atacando", "cooldown"

// --- SISTEMA DE ATAQUE (PEDRA) ---
tempo_preparacao = 120; // 2 segundos a 60fps
timer_preparacao = 0;
cooldown_ataque = 300; // 5 segundos a 60fps
timer_cooldown = 0;

// --- ANIMAÇÕES ---
// Nomes baseados nos sprites do projeto
spr_parado = spr_ogrokailo_parado;
spr_andando = spr_ogrokailo_andando;
spr_ataque = spr_ogrokailoataque;

sprite_index = spr_parado;
image_speed = 1;
