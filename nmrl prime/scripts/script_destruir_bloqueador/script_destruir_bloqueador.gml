/// @function script_destruir_bloqueador(id_bloqueador);
/// @param id_bloqueador O objeto ou instância do blockdoor que será destruído

function script_destruir_bloqueador(_bloqueador) {
    // Verifica se o objeto/instância realmente existe na sala
    if (instance_exists(_bloqueador)) {
        
        // Destrói a instância do obj_blockdoor
        with (_bloqueador) {
            instance_destroy();
        }
        
        show_debug_message("Comando do Script executado: obj_blockdoor destruído!");
    }
}