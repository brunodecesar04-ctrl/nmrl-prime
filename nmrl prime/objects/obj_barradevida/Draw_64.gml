if (instance_exists(obj_player))
{
    var _vida = clamp(obj_player.hp / obj_player.hp_max, 0, 1);

    image_index = round(_vida * 21);

    var _escala = 4;
    var _draw_x = 80;
    var _draw_y = display_get_gui_height() - 200;

    draw_sprite_ext(
        sprite_index,
        image_index,
        _draw_x,
        _draw_y,
        _escala,
        _escala,
        0,
        c_white,
        1
    );

    // --- NOVO: Números de Vida Sobrepondo a Sprite ---
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_draw_x + (_escala * 16), _draw_y + (_escala * 16), string(floor(obj_player.hp)) + " / " + string(obj_player.hp_max));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
