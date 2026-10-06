// Evento Create do obj_transicao_efeito

// Começa a animação rodando normalmente para frente
image_speed = 1; 
image_index = 0;

// Estado para saber se estamos entrando ou saindo da sala
// 1 = fechando a tela (indo para frente)
// -1 = abrindo a tela (rodando ao reverso)
estado = 1;

// Variáveis de destino (recebidas da porta)




target_x = 0; //x do player
target_y = 0; //y do player
target_room = 0; //room selecionado