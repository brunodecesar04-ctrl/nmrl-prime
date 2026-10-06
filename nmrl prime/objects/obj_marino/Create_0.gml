// Sprite padrão
sprite_index = spr_marino;

// Status de vida
hp = 3; // Vida do slime

// Estados do Inimigo
enum ESTADO_MARINO {
    PATRULHA,
    PARADO,
    OFENSIVO_PREPARANDO,
    OFENSIVO_PULANDO,
    COOLDOWN,
    MORTO
}

estado = ESTADO_MARINO.PATRULHA;

// Variáveis de patrulha/movimentação natural
vel_patrulha = 1.5;         // Velocidade ao andar pelo mapa
dir_patrulha = 0;           // Direção atual do movimento
tempo_mudar_estado = 0;     // Cronômetro para decidir se anda ou para

// Variáveis de ataque
distancia_max_pulo = 100;
contador_animacao = 0;
subimagem_anterior = 0;
destino_x = x;
destino_y = y;
velocidade_pulo = 4;
tempo_cooldown = 60;