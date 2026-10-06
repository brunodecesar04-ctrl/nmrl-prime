// ==========================================
// BOTÃO PLAY
// ==========================================


// SEMPRE LÊ O ARQUIVO NOVAMENTE
// Isso evita depender de save_existe antigo.
var _tem_save = obj_run.ler_save();


// ==========================================
// EXISTE UMA PARTIDA SALVA
// ==========================================

if (_tem_save)
{
    if (!instance_exists(obj_popup_continuar))
    {
        instance_create_layer(
            0,
            0,
            layer,
            obj_popup_continuar
        );
    }
}


// ==========================================
// NÃO EXISTE PARTIDA SALVA
// ==========================================

else
{
    // Garante uma nova run
    obj_run.apagar_run();

    obj_run.tempo_run = 0;

    obj_run.run_ativa = true;

    obj_run.run_pausada = false;

    global.jogo_pausado = false;

    global.veio_do_pause = false;


    // Primeira Room da gameplay
    room_goto(rm_lobby1);
}