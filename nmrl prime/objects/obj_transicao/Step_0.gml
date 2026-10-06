// Evento Step do obj_transition

// Se existir algum obj_blockdoor na sala, a porta fica trancada (true).
// Se NÃO existir nenhum obj_blockdoor, a porta destranca (false).
locked = instance_exists(obj_blockdoor);

show_debug_message("Status da porta: " + string(locked));