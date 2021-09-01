<?php

add_shortcode('randrecipe', 'rand_recipe');

function rand_recipe($args) {
    $args = wp_parse_args($args, ['idposts' => '']);

    $ids = explode(',', $args['idposts']);

    $post_id = $ids[rand(0, count($ids) - 1)];

    $post = get_post($post_id);

    $image = get_field('image', $post_id);
    $image_url = $image['url'];

    ob_start();
    ?>
        <h2 class="recipe-title"><?php echo $post->post_title ?></h2>
        <div class="wp-block-columns recipe-columns">
            <div class="wp-block-column" style="flex-basis: 33.33%">
                <img class="recipe-img" src="<?php echo $image_url ?>" alt="recipe image" />
                <h5 class="recipe-subtitle">Ingredients</h5>
                <div class="text-left"><?php echo the_field('ingredients', $post_id) ?></div>
            </div>
            <div class="wp-block-column" style="flex-basis: 66.66%">
                <h5 class="recipe-subtitle">Directions</h5>
                <div><?php echo the_field('directions', $post_id) ?></div>
            </div>
        </div>
    <?php
    return ob_get_clean();
}