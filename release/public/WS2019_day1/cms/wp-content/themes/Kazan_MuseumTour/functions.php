<?php

add_action('init', 'my_init');

function my_init() {
    register_nav_menu('footer', 'Footer menu for social links');
}

add_action('admin_menu', 'task_load_admin_menu');

function task_load_admin_menu() {
    add_menu_page('Museums', 'Museums', 'manage_options',
        'museums_info', 'task_page', '', 20);
}

function task_page() {
    ?>
    <h1 style="margin-top: 2rem">For museum records simply add a new page.</h1>
    <h2>
        For highlighted museums, use the custom field located at the "Museums" box visible on the edit screen of pages.
    </h2>
    <?php
}

add_action('login_enqueue_scripts', 'login_page_css');

function login_page_css() {
    ?>
    <style>
        body {
            background: url('http://localhost/WS2019_day1/cms/wp-content/uploads/2021/08/museum-of-islamic-culture-3.jpg') !important;
            background-size: cover !important;
        }
        .login h1 a {
            background: none !important;
        }
    </style>
    <?php
}