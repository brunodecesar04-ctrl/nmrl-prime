// Frame 0 = inativo | Frame 1 = ativo (Frame 2 da sprite)
var _frame_skill = skill_ativa ? 1 : 0;

// Desenha o botão de skill no canto inferior direito
draw_sprite(spr_skill, _frame_skill, skill_btn_x, skill_btn_y);