<?php
include_once "login-page.php";

add_action( 'wp_enqueue_scripts', 'child_styles' );

function child_styles() {
    wp_enqueue_style( 'sample_underscores-style', get_stylesheet_directory_uri().'/../sample_underscores/style.css', array(), wp_get_theme()->get( 'Version' ) );
    wp_enqueue_style( 'kazan_museumtour-style', get_stylesheet_uri() );
}

add_action( 'init', 'kazan_museumtour', 10, 0 );

function kazan_museumtour() {
    register_nav_menus( array( 'footer' => "Footer" ) );

//    register_post_type( 'museum', array(
//        'labels' => array(
//            'name' => 'Museums',
//            'singular_name' => 'Museum',
//        ),
//        'query_var' => false,
//        'public' => true,
//        'show_in_rest' => true,
//        'capability_type' => 'page',
//        'rewrite' => array('slug'=>'asdasd'),
//        'supports' => array( 'title', 'editor', 'author', 'thumbnail', 'excerpt', 'trackbacks', 'custom-fields', 'revisions', 'post-formats' ),
//    ) );



// register_post_type(
//     'museums',
//     array(
//         'labels'                => array(
//             'name' => 'Museums',
//             'singular_name' => 'Museum',
//             'name_admin_bar' => _x( 'Museums', 'add new from admin bar' ),
//         ),
//         'public'                => true,
//         'publicly_queryable'    => true,
//         '_edit_link'            => 'post.php?post=%d', /* internal use only. don't use this when registering your own post type. */
//         'capability_type'       => 'page',
//         'map_meta_cap'          => true,
//         'menu_position'         => 20,
//         'menu_icon'             => 'dashicons-admin-page',
//         'hierarchical'          => true,
//         'rewrite'               => true,
//         'query_var'             => false,
//         'delete_with_user'      => true,
//         'supports'              => array( 'title', 'editor', 'author', 'thumbnail', 'page-attributes', 'custom-fields', 'comments', 'revisions' ),
//         'show_in_rest'          => true,
//         'rest_base'             => 'museums',
//         'rest_controller_class' => 'WP_REST_Posts_Controller',
//     )
// );
}