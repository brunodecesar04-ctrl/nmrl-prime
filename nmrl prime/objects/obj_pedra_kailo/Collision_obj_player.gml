// A pedra só causa dano se ainda estiver rolando (pode_causar_dano == true)
if (pode_causar_dano) {
    if (variable_instance_exists(other, "hp")) {
        other.hp -= dano;
    }
    instance_destroy(); // Destrói ao atingir o player
}
// Se a pedra já parou (image_index = 1), ela não faz nada ao tocar o player
