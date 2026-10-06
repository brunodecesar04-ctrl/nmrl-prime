// --- ESTADOS DA HUD E CUTSCENE ---
em_cutscene = false;
altura_barra_cutscene = 0; // Para as barras pretas de cinema
altura_max_barra = 40;     // Tamanho final das barras em pixels

// --- EFEITOS VISUAIS (FADE / TRANSIÇÃO) ---
alpha_fade = 0;           // 0 = Transparente, 1 = Tela Preta
vel_fade = 0.02;          // Velocidade do efeito
fade_estado = 0;          // 0 = Parado, 1 = Escurecendo (Fade Out), 2 = Clareando (Fade In)

// --- POSICIONAMENTO ---
gui_largura = display_get_gui_width();
gui_altura = display_get_gui_height();