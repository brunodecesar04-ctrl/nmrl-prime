// Garante a destruição do obj_aviso caso a pedra seja removida antes do tempo
if (instance_exists(instancia_aviso)) {
    instance_destroy(instancia_aviso);
}