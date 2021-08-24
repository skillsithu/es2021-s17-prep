<?php
/*
Plugin Name: Video gallery
Description: Video gallery for task
Text Domain: video-gallery-for-task
Version: 1.0.0
*/

add_action('init', 'register_videos');

function register_videos() {
    register_post_type( 'video_gallery_item', array(
        'labels' => array(
            'name' => 'Video Gallery Items',
            'singular_name' => 'Video Gallery Item',
            'add_new_item' => 'Add New Video Gallery Item'
        ),
        'rewrite' => false,
        'query_var' => false,
        'public' => true,
        'supports' => array(
            'title',
        ),
    ) );
}

add_shortcode('video_gallery', 'video_gallery');

function video_gallery() {
    $videos = get_posts(['post_type' => 'video_gallery_item']);
    $current_videos = array_filter($videos, function($video) {
        return (bool)get_field('current', $video->ID);
    });
    $other_videos = array_filter($videos, function($video) {
        return !((bool)get_field('current', $video->ID));
    });
    ob_start();
    ?>

    <?php foreach ($current_videos AS $current) { ?>
    <video preload="metadata" width="1280" height="720"
           src="<?php echo get_field('video', $current->ID)['url']; ?>"
           style="width: 100%; height: auto"
           autoplay muted loop
           id="main_vid">
        <source type="video/mp4" src="<?php echo get_field('video', $current->ID)['url']; ?>">
    </video>
    <?php } ?>
    <div style="display: flex">
        <?php foreach ($other_videos AS $video) { ?>
        <div style="flex: 1">
            <video class="wp-video-shortcode" preload="metadata" width="1280" height="720"
                   src="<?php echo get_field('video', $video->ID)['url']; ?>"
                   style="width: 100%; height: auto" loop muted
                   id="vid_<?php echo $video->ID ?>" onmouseenter="vid_play('vid_<?php echo $video->ID ?>')" onmouseleave="vid_play('main_vid')">
                <source type="video/mp4" src="<?php echo get_field('video', $video->ID)['url']; ?>">
            </video>
            <h5 style="text-align: center"><?php the_field('year', $video->ID) ?>, <?php the_field('place', $video->ID) ?></h5>
        </div>
        <?php } ?>
    </div>

    <script>
        let played = 'main_vid';
        function vid_play(id) {
            played && document.getElementById(played).pause();
            played = id;
            document.getElementById(played).play();
        }
    </script>
    <?php
    return ob_get_clean();
}