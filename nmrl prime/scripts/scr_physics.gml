/// @function mover_com_colisao(_vx, _vy)
/// Função GLOBAL de movimentação com colisão.
/// Pode ser chamada por qualquer objeto do jogo.
function mover_com_colisao(_vx, _vy) {
    var _colidiu = false;

    // Colisão Horizontal
    if (place_meeting(x + _vx, y, obj_bloco)) {
        while (!place_meeting(x + sign(_vx), y, obj_bloco)) {
            x += sign(_vx);
        }
        _vx = 0;
        _colidiu = true;
    }
    x += _vx;

    // Colisão Vertical
    if (place_meeting(x, y + _vy, obj_bloco)) {
        while (!place_meeting(x, y + sign(_vy), obj_bloco)) {
            y += sign(_vy);
        }
        _vy = 0;
        _colidiu = true;
    }
    y += _vy;

    return _colidiu;
}
