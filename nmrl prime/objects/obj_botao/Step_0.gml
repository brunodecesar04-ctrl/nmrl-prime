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