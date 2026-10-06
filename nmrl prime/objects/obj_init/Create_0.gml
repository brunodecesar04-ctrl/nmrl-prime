// Objeto de Inicialização Global
// Este objeto deve ser o primeiro da lista de instâncias na primeira sala do jogo.

// 1. Inicializa os inputs globais imediatamente
script_execute(init_global_inputs);

// 2. Inicializa a biblioteca de dados do jogo
script_execute(init_//game_library);

// 3. Destrói a si mesmo após inicializar tudo
instance_destroy();
