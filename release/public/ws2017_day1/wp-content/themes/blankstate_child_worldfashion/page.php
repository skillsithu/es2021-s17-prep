<?php get_header(); ?>
    <?php
    $post_data = get_post(0);
    $is_home = (bool)$post_data->current;
    ?>
    <?php if ($is_home) {
        echo do_shortcode('[video_gallery]');
    } else {
        ?>
        <video preload="metadata" width="1280" height="720"
               src="<?php the_field('video') ?>"
               style="width: 100%; height: auto"
               autoplay muted loop
               id="main_vid">
            <source type="video/mp4" src="<?php the_field('video') ?>">
        </video>
        <?php
    } ?>
    <main id="content" role="main" class="<?php echo $is_home ? 'main-home' : 'main-past' ?>">
        <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>

            <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                <header class="header">
                    <h1 class="entry-title" itemprop="name"><?php the_title(); ?></h1> <?php //edit_post_link(); ?>
                </header>
                <div class="entry-content" itemprop="mainContentOfPage">
                    <?php if ( has_post_thumbnail() ) { the_post_thumbnail( 'full', array( 'itemprop' => 'image' ) ); } ?>
                    <?php the_content(); ?>
                    <div class="entry-links"><?php wp_link_pages(); ?></div>
                </div>

                <hr class="wp-block-separator">
                <div>
                    <h2>Dates</h2>
                    <div>Start Date: <?php echo $post_data->start_date ?></div>
                    <div>End Date: <?php echo $post_data->end_date ?></div>
                </div>

                <hr class="wp-block-separator">
                <div>
                    <h2>Location</h2>
                    <img src="<?php echo wp_get_attachment_image_src($post_data->location)[0]; ?>" />
                    <span><?php echo $post_data->place ?></span>
                </div>
            </article>
        <?php endwhile; endif; ?>
    </main>
<?php get_footer(); ?>