<?php

if ( ! defined( 'WP_UNINSTALL_PLUGIN' ) ) {
    exit();
}

function wpcf7_delete_plugin() {
    global $wpdb;

    $posts = get_posts(
        array(
            'numberposts' => -1,
            'post_type' => 'cf7-data',
            'post_status' => 'any',
        )
    );

    foreach ( $posts as $post ) {
        wp_delete_post( $post->ID, true );
    }
}

wpcf7_delete_plugin();
