if (room != rm_controles) exit;

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();
var _center_x = _gui_width * 0.5;
var _center_y = _gui_height * 0.5;
var _card_width = 200;
var _card_gap = 20;
var _card_left = _center_x - 330;
var _card_y = _center_y + 10;

draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, _gui_width, _gui_height, false);

draw_set_alpha(0.94);
draw_set_color(make_color_rgb(32, 38, 48));
draw_rectangle(_center_x - 370, _center_y - 190, _center_x + 370, _center_y + 190, false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(_center_x, _center_y - 145, "O que você está usando agora?");

var _labels = ["Teclado", "Xbox", "PlayStation 4 / 5"];
var _details = [
    "WASD mover  |  P atacar  |  O defender  |  Shift dash",
    "Analógico/D-pad  |  A atacar  |  B defender  |  X dash",
    "Analógico/D-pad  |  X atacar  |  Círculo defender  |  Quadrado dash"
];

for (var _option = 0; _option < 3; _option++) {
    var _x1 = _card_left + _option * (_card_width + _card_gap);
    var _x2 = _x1 + _card_width;

    draw_set_color((_option == selecao_controle)
        ? make_color_rgb(67, 133, 191)
        : make_color_rgb(57, 65, 78));
    draw_rectangle(_x1, _card_y, _x2, _card_y + 80, false);

    draw_set_color(c_white);
    draw_text((_x1 + _x2) * 0.5, _card_y + 26, _labels[_option]);
    draw_set_color(make_color_rgb(205, 212, 222));
    draw_text((_x1 + _x2) * 0.5, _card_y + 56, "Selecionar");
}

draw_set_color(make_color_rgb(218, 222, 230));
draw_text(_center_x, _center_y + 100, _details[selecao_controle]);
draw_text(_center_x, _center_y + 125, "Setas/A-D/D-pad: escolher  |  Enter/A/X: confirmar  |  clique para selecionar");

if (selecao_aviso != "") {
    draw_set_color(make_color_rgb(255, 190, 115));
    draw_text(_center_x, _center_y + 160, selecao_aviso);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
