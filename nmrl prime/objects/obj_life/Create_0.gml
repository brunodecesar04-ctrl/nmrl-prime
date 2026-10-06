image_speed = 0;
image_index = image_number - 1;

player_ref = noone;
with (obj_player) {
    if (object_index == obj_player) { // garante que é o pai "puro", não um filho
        other.player_ref = id;
    }
}