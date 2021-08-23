<?php
/*
Plugin Name: My plugin for task
Text Domain: myplugintask
Version: 1.0.0
*/

add_action( 'admin_menu', 'my_admin_menu', 9, 0 );

function my_admin_menu() {
	add_menu_page( 'Plugin works!',
        'My new admin menu',
		'manage_options', 'myplugintask',
        'myplugintask');
}

function myplugintask() {
    echo 'Plugin works!';
}
