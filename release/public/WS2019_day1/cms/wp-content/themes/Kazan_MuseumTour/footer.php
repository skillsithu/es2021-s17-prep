<?php get_field('highlighted_museum') ?: get_sidebar(); ?>
</div>
<footer id="footer" role="contentinfo">
    <?php wp_nav_menu( array( 'theme_location' => 'footer' ) ); ?>
    <div id="copyright">
        Copyright &copy; <?php echo esc_html( date_i18n( __( 'Y', 'blankslate' ) ) ); ?> - All rights reserved
    </div>
</footer>
</div>
<?php wp_footer(); ?>
</body>
</html>