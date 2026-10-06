// --- SHADER DE DALTONISMO (SIMULADO VIA CODIGO) ---
// Como shaders requerem arquivos .fsh/.vsh, implementamos a lógica de cores aqui
// para que o obj_control possa alternar as cores da interface e objetos.

global.filtro_daltonismo = "nenhum"; // "nenhum", "protanopia", "deuteranopia", "tritanopia"

global.cor_aviso_padrao = c_yellow;
global.cor_aviso_filtro = c_white;

// Função para atualizar cores baseadas no filtro
function atualizar_cores_daltonismo() {
    switch(global.filtro_daltonismo) {
        case "protanopia":
            global.cor_aviso_filtro = c_blue;
            break;
        case "deuteranopia":
            global.cor_aviso_filtro = c_orange;
            break;
        case "tritanopia":
            global.cor_aviso_filtro = c_magenta;
            break;
        default:
            global.cor_aviso_filtro = global.cor_aviso_padrao;
            break;
    }
}
