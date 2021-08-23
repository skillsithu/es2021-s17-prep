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
//        'rewrite' => false,
//        'query_var' => false,
//        'public' => true,
//        'capability_type' => 'page',
//        'supports' => array( 'title', 'editor', 'author', 'thumbnail', 'excerpt', 'trackbacks', 'custom-fields', 'revisions', 'post-formats' ),
//    ) );
}