<?php get_sidebar(); ?>
    </div>
    <footer id="footer" role="contentinfo">
        <?php echo do_shortcode('[DISPLAY_ULTIMATE_SOCIAL_ICONS]'); ?>
        <div id="copyright">
            &copy; <?php echo esc_html( date_i18n( __( 'Y', 'blankslate' ) ) ); ?> <?php echo esc_html( get_bloginfo( 'name' ) ); ?>
        </div>
    </footer>
    </div>
<?php wp_footer(); ?>
    </body>
    </html>
