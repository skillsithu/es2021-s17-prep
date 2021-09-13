<?php
/*-----------------------------------------------------------------------------------*/
/* This template will be called by all other template files to begin
/* rendering the page and display the header/nav
/*-----------------------------------------------------------------------------------*/
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>" />
    <meta name="viewport" content="width=device-width" />
    <title>
        <?php bloginfo('name'); // show the blog name, from settings ?> |
        <?php is_front_page() ? bloginfo('description') : wp_title(''); // if we're on the home page, show the description, from the site's settings - otherwise, show the title of the post or page ?>
    </title>

    <link rel="profile" href="http://gmpg.org/xfn/11" />
    <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
    <?php // We are loading our theme directory style.css by queuing scripts in our functions.php file,
    // so if you want to load other stylesheets,
    // I would load them with an @import call in your style.css
    ?>

    <?php // Loads HTML5 JavaScript file to add support for HTML5 elements in older IE versions. ?>
    <!--[if lt IE 9]>
<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js" type="text/javascript"></script>
<![endif]-->

    <?php wp_head();
    // This fxn allows plugins, and Wordpress itself, to insert themselves/scripts/css/files
    // (right here) into the head of your website.
    // Removing this fxn call will disable all kinds of plugins and Wordpress default insertions.
    // Move it if you like, but I would keep it around.
    ?>

</head>

<body
    <?php body_class();
    // This will display a class specific to whatever is being loaded by Wordpress
    // i.e. on a home page, it will return [class="home"]
    // on a single post, it will return [class="single postid-{ID}"]
    // and the list goes on. Look it up if you want more.
    ?>
>

<header id="masthead" class="site-header">
    <div id="nav-container">
        <div class="center">

            <div id="brand">
                <h1 class="site-title">
                    <a href="<?php echo esc_url( home_url( '/' ) ); // Link to the home page ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); // Title it with the blog name ?>" rel="home">
                        <img src="http://192.168.1.76/es2018_day1_cms/wp-content/uploads/2021/09/Kurtosh_Kolach.png" alt="<?php bloginfo( 'name' ); // Display the blog name ?>" />
                    </a>
                </h1>
            </div><!-- /brand -->

            <div class="clear"></div>
        </div><!--/container -->


        <div class="container center">

            <nav class="site-navigation main-navigation">
                <?php wp_nav_menu( array( 'theme_location' => 'primary' ) ); // Display the user-defined menu in Appearance > Menus ?>
            </nav><!-- .site-navigation .main-navigation -->
        </div>
    </div>

</header><!-- #masthead .site-header -->

<script>
    function setActive(element) {
        var previous = document.querySelector(".main-navigation ul li a.active");
        if (!!previous) {
            previous.classList.remove("active");
        }
        element.classList.add("active");
    }

    jQuery('.main-navigation ul li a').each(function() {
        jQuery(this).click(function(event) {
            event.preventDefault()
            event.stopPropagation()

            var self = this
            setTimeout(function() {
                setActive(self)
            }, 601)

            var target = jQuery(this.getAttribute('href')).offset().top;
            jQuery("html").animate({
                scrollTop: target - jQuery("#masthead").height() - 16
            }, 600)
        })
    })

    document.addEventListener("scroll", function(event) {
        if (jQuery("html").scrollTop() === 0) {
            document.querySelector("#masthead").classList.remove("scrolled");
        } else {
            document.querySelector("#masthead").classList.add("scrolled");
        }

        var found = undefined;
        jQuery('.main-navigation ul li a').each(function() {
            if (!found) {
                var top = document.querySelector(this.getAttribute('href')).getBoundingClientRect().top;
                if (top > 0) {
                    found = true;
                    setActive(this);
                }
            }
        })
    })
</script>

<div id="header-image">
    <?php bloginfo( 'name' ); // Display the blog name ?>
</div>

<main class="main-fluid"><!-- start the page containter -->
