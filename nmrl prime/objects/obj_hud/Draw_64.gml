// 1. DESENHO DA VIDA (Removido daqui para evitar duplicata com obj_barradevida)
// A vida agora é desenhada exclusivamente pelo obj_barradevida

// --- HUD de RPG (Nível, Moedas, XP e Tempo) ---
draw_set_font(-1);
draw_set_halign(fa_left);

// Exibição de Nível e Moedas
draw_set_color(c_yellow);
draw_text(20, 60, "Nível: " + string(global.nivel_jogador));
draw_set_color(c_white);
draw_text(20, 80, "Moedas: " + string(global.moedas_jogador) + " G");

// --- BARRA DE XP (Lado Direito, Canto Superior) ---
var _bar_width = 200;
var _bar_height = 12;
var _xp_perc = clamp(global.xp_atual / global.xp_para_proximo_nivel, 0, 1);

var _xp_x = gui_largura - _bar_width - 20;
var _xp_y = 60;

draw_set_color(c_black);
draw_rectangle(_xp_x, _xp_y, _xp_x + _bar_width, _xp_y + _bar_height, false);
draw_set_color(c_lime);
draw_rectangle(_xp_x, _xp_y, _xp_x + (_bar_width * _xp_perc), _xp_y + _bar_height, false);
draw_set_color(c_white);
draw_text(_xp_x, _xp_y + 14, "XP: " + string(floor(global.xp_atual)) + " / " + string(global.xp_para_proximo_nivel));

// --- HUD DE ITEM EQUIPADO (QUADRADO OCO - Lado Esquerdo) ---
var _slot_x = 20;
var _slot_y = 140;
var _slot_size = 40;

draw_set_color(c_white);
draw_rectangle(_slot_x, _slot_y, _slot_x + _slot_size, _slot_y + _slot_size, true);

draw_set_font(-1);
var _item_nome = (variable_global_exists("item_equipado")) ? global.item_equipado : "Nenhum";
draw_text(_slot_x + _slot_size + 10, _slot_y + 10, "Item: " + string(_item_nome));

// Cronômetro de Speedrun
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(gui_largura - 20, 20, "Tempo: " + scr_formatar_tempo_speedrun(global.tempo_speedrun));
draw_set_halign(fa_left);

// 2. DESENHO DAS BARRAS DE CUTSCENE
if (altura_barra_cutscene > 0.5) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_largura, altura_barra_cutscene, false);
    draw_rectangle(0, gui_altura - altura_barra_cutscene, gui_largura, gui_altura, false);
    draw_set_color(c_white);
}

// 3. DESENHO DO FADE de TELA
if (alpha_fade > 0) {
    draw_set_alpha(alpha_fade);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_largura, gui_altura, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
