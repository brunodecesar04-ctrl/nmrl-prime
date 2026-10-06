// Evento Destroy do obj_blockdoor

// Se houver uma porta associada no Creation Code, avisa ela
if (targetdoor != noone && instance_exists(targetdoor)) {
    locked = false;
}

// Mensagem no console para testar
show_debug_message("obj_blockdoor destruído e caminho liberado!");