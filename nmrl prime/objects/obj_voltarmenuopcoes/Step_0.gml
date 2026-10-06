var _esquerda = 76;
var _direita = 144;

var _cima = 0;
var _baixo = 40;

if (mouse_x >= _esquerda &&
    mouse_x <= _direita &&
    mouse_y >= _cima &&
    mouse_y <= _baixo)
{
    image_xscale = 0.375 * 0.9;
    image_yscale = 0.375 * 0.9;
}
else
{
    image_xscale = 0.375;
    image_yscale = 0.375;
}