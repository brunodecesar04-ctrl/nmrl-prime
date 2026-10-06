/// @function scr_web_integration()
/// Gerencia a conexão com o banco de dados externo (InfinityFree).

function enviar_tempo_ranking() {
    if (global.usuario_logado == "") {
        show_debug_message("Erro: Nenhum usuário logado para enviar ranking.");
        return;
    }

    var _url = "http://seu-site-infinityfree.com/api/save_time.php";
    var _params = "user=" + global.usuario_logado + "&time=" + string(global.tempo_speedrun);

    // Faz a requisição HTTP assíncrona para o site
    var _req = http_post_string(_url, _params);
    show_debug_message("Enviando tempo para o ranking...");
}

function login_usuario(_user, _pass) {
    var _url = "http://seu-site-infinityfree.com/api/login.php";
    var _params = "user=" + _user + "&pass=" + _pass;

    // O GameMaker receberá a resposta no evento Async - HTTP
    http_post_string(_url, _params);
}
