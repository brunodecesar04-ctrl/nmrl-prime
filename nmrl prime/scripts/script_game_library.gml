function init_game_library() {
    global.game_data = {
        controls: {
            movimento: "Setas ou WASD / Analógicos",
            ataque: "Z ou Botão A (Xbox) / X (PS)",
            parry: "O ou Botão B (Xbox) / Círculo (PS)",
            dash: "Shift",
            pause: "Esc"
        },
        mecanicas: {
            parry_window: "100ms",
            kailo_cooldown: "5 segundos",
            kailo_delay: "2 segundos"
        },
        versao: "1.0.0 - Beta"
    };
}
