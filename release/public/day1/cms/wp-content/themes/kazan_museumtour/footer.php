<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package sample_underscores
 */

?>

</div><!-- #content -->

<footer id="colophon" class="site-footer">
    <div>
        <?php
        wp_nav_menu( array(
            'theme_location' => 'footer',
            'menu_id'        => 'footer-menu',
        ) );
        ?>
    </div>
    <div class="site-info">
        Copyright &copy; <?php echo date('Y'); ?> - All right reserved.
    </div><!-- .site-info -->
</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
