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
define( 'DB_NAME', 'ws2019_day1_speedtest_cmd' );

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
define( 'AUTH_KEY',         'vjF{jfd|D*%:]D)KWk$m6&Cy|h#CR7vXC0Py~S#z4a3whrVp1Rw)@5V$?p^lAiey' );
define( 'SECURE_AUTH_KEY',  'gF@J#bFo__LU.!o4`OH*VS0+61e<+hn` [ds~|:h&A4xG[b#{GyfkritNxo>Tg-j' );
define( 'LOGGED_IN_KEY',    '@yOfL1PmtxBDM@m)_U@vcie<*rQo`zn[?(j=x`Dz$:P$Zsu:>0km]Dm &p!=ej$=' );
define( 'NONCE_KEY',        'J4llE2)iD/AUSV0NE._.z4ZGPw;Uag{VsyM/,aHm/o$ag0:Rf~@4f&NH^KaZn%>7' );
define( 'AUTH_SALT',        '4z,A0y?>^9t5W~eNWJWO7?E%%/kS3cp-4SyC_ZrZD~yuE952#rtTG4W:eB+H*qLw' );
define( 'SECURE_AUTH_SALT', '[ffSJ%{8q2h{{YNqz1 M.WWhY%Zi6,;Vldxzef864J-:Iy o5.1EB}yOi}mtFOu[' );
define( 'LOGGED_IN_SALT',   ']E08u.T(}0.ekx<L).VJWW%+27Zbn>!U7U2P+WBoV6t11$+W?Ib-A4P$GyreL}>2' );
define( 'NONCE_SALT',       'YpIB-{iFN>5l?MO#RAuavM&nj_f!VwLb`l]VQ`GJfOl5A&yYn4BK,-G5XOx1jfFI' );

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
