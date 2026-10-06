// --- GERENCIAMENTO DE CUTSCENE (Barras pretas) ---
if (em_cutscene) {
    // Fazer as barras subirem/descerem suavemente
    altura_barra_cutscene = lerp(altura_barra_cutscene, altura_max_barra, 0.1);
} else {
    altura_barra_cutscene = lerp(altura_barra_cutscene, 0, 0.1);
}

// --- GERENCIAMENTO DO FADE (Transição de tela/efeitos) ---
if (fade_estado == 1) { // Escurecendo
    alpha_fade += vel_fade;
    if (alpha_fade >= 1) {
        alpha_fade = 1;
        fade_estado = 2; // Começa a clarear (ou mude de sala aqui)
    }
} else if (fade_estado == 2) { // Clareando
    alpha_fade -= vel_fade;
    if (alpha_fade <= 0) {
        alpha_fade = 0;
        fade_estado = 0; // Finaliza o efeito
    }
}