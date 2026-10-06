// ==========================================
// FUNDO ESCURO
// ==========================================

draw_set_alpha(0.65);

draw_set_color(c_black);

draw_rectangle(
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height(),
    false
);

draw_set_alpha(1);


// ==========================================
// JANELA PRETA
// ==========================================

draw_set_color(c_black);

draw_rectangle(
    popup_x,
    popup_y,

    popup_x + popup_largura,
    popup_y + popup_altura,

    false
);


// ==========================================
// BORDA AMARELA
// ==========================================

draw_set_color(c_yellow);

draw_rectangle(
    popup_x,
    popup_y,

    popup_x + popup_largura,
    popup_y + popup_altura,

    true
);


// ==========================================
// TÍTULO
// ==========================================

draw_set_color(c_yellow);

draw_set_halign(fa_center);

draw_text(
    display_get_gui_width() / 2,
    popup_y + 40,
    "CONTINUAR ULTIMO JOGO?"
);


// ==========================================
// TEMPO
// ==========================================

draw_text(
    display_get_gui_width() / 2,
    popup_y + 90,
    "Tempo salvo: " + string(obj_run.save_tempo)
);


// ==========================================
// BOTÃO CONTINUAR
// ==========================================

draw_set_color(c_black);

draw_rectangle(
    popup_x + 100,
    popup_y + 140,
    popup_x + 500,
    popup_y + 190,
    false
);

draw_set_color(c_yellow);

draw_rectangle(
    popup_x + 100,
    popup_y + 140,
    popup_x + 500,
    popup_y + 190,
    true
);

draw_text(
    display_get_gui_width() / 2,
    popup_y + 155,
    "CONTINUAR"
);


// ==========================================
// BOTÃO NOVO JOGO
// ==========================================

draw_set_color(c_black);

draw_rectangle(
    popup_x + 100,
    popup_y + 210,
    popup_x + 500,
    popup_y + 260,
    false
);

draw_set_color(c_yellow);

draw_rectangle(
    popup_x + 100,
    popup_y + 210,
    popup_x + 500,
    popup_y + 260,
    true
);

draw_text(
    display_get_gui_width() / 2,
    popup_y + 225,
    "NOVO JOGO"
);


// ==========================================
// X
// ==========================================

draw_text(
    popup_x + popup_largura - 35,
    popup_y + 10,
    "X"
);

draw_set_halign(fa_left);