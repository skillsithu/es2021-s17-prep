<?php get_header(); ?>
    <main id="content" role="main"
        <?php if (get_field('highlighted_museum')) {
            echo ' class="highlighted"';
            echo ' style="background-image: url('.wp_get_attachment_image_url(get_post_thumbnail_id(), 'full').')"';
        }?>
    }
    >
        <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
            <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                <header class="header">
                    <h1 class="entry-title" itemprop="name"><?php the_title(); ?></h1>
                </header>
                <div class="entry-content" itemprop="mainContentOfPage">
                    <?php if ( has_post_thumbnail() && !get_field('highlighted_museum') ) { the_post_thumbnail( 'full', array( 'itemprop' => 'image' ) ); } ?>
                    <?php the_content(); ?>
                    <div class="entry-links"><?php wp_link_pages(); ?></div>
                </div>
            </article>
            <?php if ( comments_open() && !post_password_required() ) { comments_template( '', true ); } ?>
        <?php endwhile; endif; ?>
    </main>
<?php get_footer(); ?>