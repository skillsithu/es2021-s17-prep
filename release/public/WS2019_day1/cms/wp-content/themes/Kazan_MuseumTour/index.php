<?php get_header(); ?>
<div class="content-index">
    <h1>Latest News</h1>
    <main id="content" role="main">
        <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
            <?php get_template_part( 'entry' ); ?>
        <?php endwhile; endif; ?>
        <?php get_template_part( 'nav', 'below' ); ?>
    </main>
</div>
<?php get_footer(); ?>