<?php

add_shortcode('kazan_login', 'kazan_login');

function kazan_login() {
    ob_start();
    wp_login_form();
    return ob_get_clean();
}
