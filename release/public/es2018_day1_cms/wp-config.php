<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'es2018_cms' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '+}HZ8%S/8ezXS{jUGADMF:z*]?:E,VO*dR JyY-P,:*jn1{A;,RE|.!fcd=4[2[q' );
define( 'SECURE_AUTH_KEY',  ':O`c**<Z4CWlv]AzEVv>H.Nq6?AAn)tmdz$ ,<b`zC0U.WFS]fzJ;jhRU;6ND~mq' );
define( 'LOGGED_IN_KEY',    '=_mH=c>)gm.^M#kwC)5UC]2JFo pmz4F]M:Ep2Nvfd:]iB+&dlMV/037OZGIU&)2' );
define( 'NONCE_KEY',        'QDadiP2`mub`%2diDl 0 yh4Q@@*[Z,qJ9@k`:o[?Eo6%[E/PT58rdO~lc5]#%%H' );
define( 'AUTH_SALT',        'HOw`Fv2PL$i 7iUN4=*PCO i``j,= zr`^0Zq2[7-M.nRGE;7;y2y8HZ1fY;XOS#' );
define( 'SECURE_AUTH_SALT', '%2Zxo-@0oP^N_!{<=EEN? uiAYL@CyJpTMx&gA>$>)#g5[M}C)8KFN3xD9ZB|1?V' );
define( 'LOGGED_IN_SALT',   '~8.8vZkt<eE,k[+|F~-orDp-x` `(#_S0U/#z[p=l7|6VB,;v|~zsIG34jlP2vda' );
define( 'NONCE_SALT',       '==1,#-epf0^*!$q/p8^:L9Uic*oIA8h!0**A  vQ9t9)Pl`vhwXLc5Alm2_#>!N/' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
