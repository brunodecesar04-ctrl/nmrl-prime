// Evento DRAW GUI do obj_transicao_efeito

// Desenha o sprite cobrindo exatamente o tamanho da janela da Viewport
draw_sprite_stretched(
    sprite_index, 
    image_index, 
    0, 
    0, 
    display_get_gui_width(), 
    display_get_gui_height()
);