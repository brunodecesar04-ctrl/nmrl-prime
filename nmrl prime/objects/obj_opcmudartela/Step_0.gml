if (mouse_check_button_pressed(mb_left))
{
    if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
    {
        window_set_fullscreen(!window_get_fullscreen());

        if (window_get_fullscreen())
        {
            image_index = 0;
        }
        else
        {
            image_index = 1;
        }
    }
}
var _esquerda = 544;
var _direita = 832;

var _cima = 440;
var _baixo = 558;

if (mouse_x >= _esquerda &&
    mouse_x <= _direita &&
    mouse_y >= _cima &&
    mouse_y <= _baixo)
{
    image_xscale = 1.125 * 0.9;
    image_yscale = 1 * 0.9;
}
else
{
    image_xscale = 1.125;
    image_yscale = 1;
}