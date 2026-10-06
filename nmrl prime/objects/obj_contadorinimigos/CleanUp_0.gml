// Garante que a memória da lista seja liberada
if (ds_exists(lista_inimigos, ds_type_list)) {
    ds_list_destroy(lista_inimigos);
}