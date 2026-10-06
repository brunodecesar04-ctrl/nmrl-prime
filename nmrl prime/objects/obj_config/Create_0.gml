window_set_fullscreen(true);
arquivo_config = "config.ini";

// Valores padrão
volume_geral = 1;
volume_inimigo = 1;
volume_ataque = 1;
volume_musica = 1;

// Carregar configurações salvas
if (file_exists(arquivo_config))
{
    ini_open(arquivo_config);

    volume_geral = ini_read_real("audio", "geral", 1);
    volume_inimigo = ini_read_real("audio", "inimigo", 1);
    volume_ataque = ini_read_real("audio", "ataque", 1);
    volume_musica = ini_read_real("audio", "musica", 1);

    ini_close();
}

// Função para salvar
salvar_config = function()
{
    ini_open(arquivo_config);

    ini_write_real("audio", "geral", volume_geral);
    ini_write_real("audio", "inimigo", volume_inimigo);
    ini_write_real("audio", "ataque", volume_ataque);
    ini_write_real("audio", "musica", volume_musica);

    ini_close();
};