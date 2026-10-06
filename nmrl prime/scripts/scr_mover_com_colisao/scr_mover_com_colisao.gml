function mover_com_colisao(_vx, _vy){
    // Movimentação Horizontal
    if (place_meeting(x + _vx, y, obj_bloco)) {
        while (!place_meeting(x + sign(_vx), y, obj_bloco)) {
            x += sign(_vx);
        }
        _vx = 0;
    }
    x += _vx;

    // Movimentação Vertical
    if (place_meeting(x, y + _vy, obj_bloco)) {
        while (!place_meeting(x, y + sign(_vy), obj_bloco)) {
            y += sign(_vy);
        }
        _vy = 0;
    }
    y += _vy;
}
