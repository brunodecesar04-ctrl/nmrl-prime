// ==========================================
// POPUP DE PAUSE
// ==========================================

if (
    global.jogo_pausado &&
    room != rm_opcoes &&
    room != rm_volumes &&
    room != rm_menuinicial
)
{
    // ======================================
    // ESCURECER A GAMEPLAY
    // ======================================

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


    // ======================================
    // JANELA PRETA
    // ======================================

    draw_set_color(c_black);

    draw_rectangle(
        popup_x,
        popup_y,
        popup_x + popup_largura,
        popup_y + popup_altura,
        false
    );


    // ======================================
    // BORDA AMARELA DA JANELA
    // ======================================

    draw_set_color(c_yellow);

    draw_rectangle(
        popup_x,
        popup_y,
        popup_x + popup_largura,
        popup_y + popup_altura,
        true
    );


    // ======================================
    // TÍTULO
    // ======================================

    draw_set_color(c_yellow);
    draw_set_halign(fa_center);

    draw_text(
        display_get_gui_width() / 2,
        popup_y + 55,
        "JOGO PAUSADO"
    );


    // ======================================
    // BOTÃO CONTINUAR
    // ======================================

    draw_set_color(c_black);

    draw_rectangle(
        botao_x,
        botao_continuar_y,
        botao_x + botao_largura,
        botao_continuar_y + botao_altura,
        false
    );

    draw_set_color(c_yellow);

    draw_rectangle(
        botao_x,
        botao_continuar_y,
        botao_x + botao_largura,
        botao_continuar_y + botao_altura,
        true
    );

    draw_set_color(c_yellow);

    draw_text(
        display_get_gui_width() / 2,
        botao_continuar_y + 18,
        "CONTINUAR"
    );


    // ======================================
    // BOTÃO OPÇÕES
    // ======================================

    draw_set_color(c_black);

    draw_rectangle(
        botao_x,
        botao_opcoes_y,
        botao_x + botao_largura,
        botao_opcoes_y + botao_altura,
        false
    );

    draw_set_color(c_yellow);

    draw_rectangle(
        botao_x,
        botao_opcoes_y,
        botao_x + botao_largura,
        botao_opcoes_y + botao_altura,
        true
    );

    draw_set_color(c_yellow);

    draw_text(
        display_get_gui_width() / 2,
        botao_opcoes_y + 18,
        "OPCOES"
    );


    // ======================================
    // BOTÃO MENU PRINCIPAL
    // ======================================

    draw_set_color(c_black);

    draw_rectangle(
        botao_x,
        botao_menu_y,
        botao_x + botao_largura,
        botao_menu_y + botao_altura,
        false
    );

    draw_set_color(c_yellow);

    draw_rectangle(
        botao_x,
        botao_menu_y,
        botao_x + botao_largura,
        botao_menu_y + botao_altura,
        true
    );

    draw_set_color(c_yellow);

    draw_text(
        display_get_gui_width() / 2,
        botao_menu_y + 18,
        "MENU PRINCIPAL"
    );


    draw_set_halign(fa_left);
}