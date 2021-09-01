<?php
/*
Plugin Name: Contact Form 7 Database
Text Domain: c7-database
Version: 10.0.0
*/

add_action('init', 'cf7_database_init');

function cf7_database_init() {
    register_post_type( 'cf7-data', array(
        'labels' => array(
            'name' => __( 'Contact Form Items', 'contact-form-7' ),
            'singular_name' => __( 'Contact Form Item', 'contact-form-7' ),
        ),
        'rewrite' => false,
        'query_var' => false,
        'public' => false,
        'capability_type' => 'page',
        'capabilities' => array(
            'edit_post' => 'wpcf7_edit_contact_form',
            'read_post' => 'wpcf7_read_contact_form',
            'delete_post' => 'wpcf7_delete_contact_form',
            'edit_posts' => 'wpcf7_edit_contact_forms',
            'edit_others_posts' => 'wpcf7_edit_contact_forms',
            'publish_posts' => 'wpcf7_edit_contact_forms',
            'read_private_posts' => 'wpcf7_edit_contact_forms',
        ),
    ) );
}

add_action('wpcf7_mail_sent', 'cf7_database_save');

function cf7_database_save($form) {
    $data = [];
    foreach ($_POST AS $key => $value) {
        if (substr($key, 0, 1) !== '_') {
            $data[$key] = $value;
        }
    }
    $id = (int)$_POST['_wpcf7'];

    wp_insert_post([
        'post_parent' => $id,
        'post_title' => 'Message',
        'post_content' => json_encode($data),
        'post_type' => 'cf7-data',
        'post_status' => 'publish'
    ]);
}

add_action(
    'admin_menu',
    'cf7_database_admin_menu'
);

function cf7_database_admin_menu()
{
    $addnew = add_submenu_page( 'wpcf7',
        __( 'Database', 'contact-form-7' ),
        __( 'Database', 'contact-form-7' )
        . wpcf7_admin_menu_change_notice( 'wpcf7-new' ),
        'wpcf7_edit_contact_forms',
        'wpcf7-database',
        'cf7_database_page', 50
    );

    // add_action( 'load-' . $addnew, 'wpcf7_load_contact_form_admin', 10, 0 );
}
function cf7_database_page() {
    if (!isset($_GET['post'])) {
        cf7_database_list();
    } else {
        $post_id = (int)$_GET['post'];
        cf7_database_data_list($post_id);
    }
}

function cf7_database_data_list($post_id) {
    $form = get_post($post_id);

    $messages = get_posts(['post_type' => 'cf7-data', 'post_parent' => $post_id]);

    $fields = json_decode($messages[0]->post_content, true);
    ?>
    <h1>Contact Form Submissions</h1>
    <h2><?php echo $form->post_title ?></h2>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <?php foreach ($fields AS $key => $field) {
                echo '<th>'.$key.'</th>';
            } ?>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($messages AS $message) {
            echo '<tr><td>Message #'.$message->ID.'</td>';

            $fields = json_decode($message->post_content, true);
            foreach ($fields as $key => $field) {
                echo '<td>' . $field . '</td>';
            }
            echo '</tr>';
        } ?>
        </tbody>
    </table>
    <?php
}

function cf7_database_list() {
    $forms = get_posts(['post_type' => 'wpcf7_contact_form']);
    ?>
    <h1>Contact Forms</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Messages</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($forms AS $form) {
            echo '<tr><td>'.$form->ID.'</td><td><a href="?page=wpcf7-database&post='.$form->ID.'">'.$form->post_title.'</a></td><td>';
            echo count(get_posts(['post_type' => 'cf7-data', 'post_parent' => $form->ID]));
            echo '</td></tr>';
        } ?>
        </tbody>
    </table>
    <?php
}