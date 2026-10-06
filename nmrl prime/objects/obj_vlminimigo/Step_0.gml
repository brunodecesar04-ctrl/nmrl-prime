if (mouse_check_button(mb_left))
{
    if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
    {
        nivel_volume = round(
            clamp(
                (mouse_x - bbox_left) / (bbox_right - bbox_left) * 5,
                0,
                5
            )
        );

        image_index = nivel_volume;

        obj_config.volume_inimigo = nivel_volume / 5;
    }
}