<?php
/*
Plugin Name: My plugin for task
Text Domain: myplugintask
Version: 1.0.0
*/

add_action( 'init', 'my_plugin' );

function my_plugin() {
    wp_enqueue_style('fontawesome', plugin_dir_url(__FILE__).'fontawesome/css/all.css');
    wp_enqueue_style('myplugintask', plugin_dir_url(__FILE__).'myplugintask.css');
}

add_action('wp_footer', 'my_footer');

function my_footer() {
    ?>
        <div id="myplugintask">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-pinterest"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-tumblr"></i>
        </div>
    <?php
}
