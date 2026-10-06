// ==========================================
// CONTROLE DA RUN
// ==========================================

tempo_run = 0;

run_ativa = false;
run_pausada = false;


// ==========================================
// VARIÁVEIS GLOBAIS
// ==========================================

global.jogo_pausado = false;
global.veio_do_pause = false;


// ==========================================
// SAVE
// ==========================================

arquivo_save = "save_run.ini";

save_existe = false;

save_room = noone;

save_x = 0;
save_y = 0;

save_hp = 100;

save_tempo = 0;


// ==========================================
// CONTROLE DE CARREGAMENTO
// ==========================================

carregar_save = false;


// ==========================================
// CONTROLE DO PAUSE → OPÇÕES
// ==========================================

pause_room = noone;

pause_x = 0;
pause_y = 0;
pause_hp = 100;

voltando_do_pause = false;


// ==========================================
// PRIMEIRA ROOM DA GAMEPLAY
// ==========================================

room_primeira = rm_lobby1;


// ==========================================
// FUNÇÃO PARA LER O SAVE
// ==========================================

ler_save = function()
{
    // Primeiro assume que não existe save
    save_existe = false;

    save_room = noone;

    save_x = 0;
    save_y = 0;

    save_hp = 100;

    save_tempo = 0;


    // Se o arquivo não existe, não há save
    if (!file_exists(arquivo_save))
    {
        return false;
    }


    // Abre o arquivo
    ini_open(arquivo_save);


    // Verifica se existe uma run
    save_existe = ini_read_real(
        "run",
        "existe",
        0
    );


    // Lê o nome da Room
    var _nome_room = ini_read_string(
        "run",
        "room",
        ""
    );


    // Converte o nome para o Asset da Room
    if (_nome_room != "")
    {
        save_room = asset_get_index(_nome_room);
    }


    // Lê posição
    save_x = ini_read_real(
        "run",
        "x",
        0
    );

    save_y = ini_read_real(
        "run",
        "y",
        0
    );


    // Lê HP
    save_hp = ini_read_real(
        "run",
        "hp",
        100
    );


    // Lê tempo
    save_tempo = ini_read_real(
        "run",
        "tempo",
        0
    );


    // Fecha arquivo
    ini_close();


    // Validação extra
    if (save_existe <= 0)
    {
        save_existe = false;
        return false;
    }


    // Verifica se a Room foi encontrada
    if (save_room == noone)
    {
        save_existe = false;
        return false;
    }


    return true;
};


// ==========================================
// LER SAVE QUANDO O OBJ_RUN É CRIADO
// ==========================================

ler_save();


// ==========================================
// FUNÇÃO PARA SALVAR A RUN
// ==========================================

salvar_run = function()
{
    if (!instance_exists(obj_player))
    {
        return false;
    }


    // Pega os dados atuais
    save_existe = true;

    save_room = room;

    save_x = obj_player.x;
    save_y = obj_player.y;

    save_hp = obj_player.hp;

    save_tempo = tempo_run;


    // Abre o arquivo
    ini_open(arquivo_save);


    // Indica que existe uma partida
    ini_write_real(
        "run",
        "existe",
        1
    );


    // Room
    ini_write_string(
        "run",
        "room",
        room_get_name(room)
    );


    // Posição
    ini_write_real(
        "run",
        "x",
        save_x
    );

    ini_write_real(
        "run",
        "y",
        save_y
    );


    // Vida
    ini_write_real(
        "run",
        "hp",
        save_hp
    );


    // Tempo
    ini_write_real(
        "run",
        "tempo",
        save_tempo
    );


    // Fecha
    ini_close();


    return true;
};


// ==========================================
// FUNÇÃO PARA APAGAR A RUN
// ==========================================

apagar_run = function()
{
    if (file_exists(arquivo_save))
    {
        file_delete(arquivo_save);
    }


    save_existe = false;

    save_room = noone;

    save_x = 0;
    save_y = 0;

    save_hp = 100;

    save_tempo = 0;

    tempo_run = 0;

    carregar_save = false;
};