if (instance_exists(player_ref)) {
    var _porcentagem = clamp(player_ref.hp / player_ref.hp_max, 0, 1);
    image_index = round(_porcentagem * (image_number - 1));
}