// --- FILTRO DE DALTONISMO ---
init_global_inputs();
selecao_controle = 0;
selecao_aviso = "";

filtro_ativo = 0; // 0: Desativado, 1: Protanopia, 2: Deuteranopia, 3: Tritanopia
filtro_nome = "Desativado";

// Cores de ajuste (simulação simplificada)
cor_protanopia = c_gray;
cor_deuteranopia = c_gray;
cor_tritanopia = c_gray;
