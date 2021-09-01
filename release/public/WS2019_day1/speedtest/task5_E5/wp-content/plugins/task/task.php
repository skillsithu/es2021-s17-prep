<?php
/*
Plugin Name: Speedtest Task E5
Version: 10.0.0
Text Domain: task
*/

add_action('admin_enqueue_scripts', 'task_load_media');

function task_load_media() {
    wp_enqueue_media();
}

add_action('admin_menu', 'task_load_admin_menu');

function task_load_admin_menu() {
    add_menu_page('Gallery upload', 'Gallery upload', 'manage_options',
    'task_gallery_upload', 'task_page');
}

function task_page() {
    ob_start();
    ?>
    <button style="margin-top: 2rem" onclick="wp.media().open()">Upload media files to gallery of wordpress</button>
    <?php
    echo ob_get_clean();
}