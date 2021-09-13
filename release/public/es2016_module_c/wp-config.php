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
define( 'DB_NAME', 'es2016_cms' );

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
define( 'AUTH_KEY',         '|$W*7U$eEN#al>U$pa630L?@#D~k*jq)>st}Yx1C`*mzznT<>ig+Ul`$_;-vpT U' );
define( 'SECURE_AUTH_KEY',  'Pf|6!AzKL^5Ts;U$Re!z,2&65lDN5Isb.;Yi1M6>S8L*f9{MfO_M<oi3]e^?Vt!;' );
define( 'LOGGED_IN_KEY',    'L3S#i_V0/D/ex|M/j3WmadBCtEfjdxXn}h4=];;+,p:Nhd]fD}fIC2RWR*^)V`hK' );
define( 'NONCE_KEY',        'iwxnNI#=&H(v.AMRN>/[&0=[^8AwGbeT#7GMD6qd!IydZBw]gn@`n;<YiHxQsy>f' );
define( 'AUTH_SALT',        '2x3eeTbA1%)V~W|fnfPg+=;ff[S.}?u?-{1V8`qg|3-x`P1Q~[?Am@:D<{/eC<J>' );
define( 'SECURE_AUTH_SALT', 'R0:1saCa1{0hxXC7%(|f1?FBy-p*B79P.JynX6=zUWB;^_IK@F=3 2UMv|Gfhvf)' );
define( 'LOGGED_IN_SALT',   'z|c1o-r4wm.g_RRJ`; y,[ny<9`6kv=11N 4ao>y`X&74Y]11O!a2)!{Zu&(bC~u' );
define( 'NONCE_SALT',       'JVja)Iae[aQhp2w]qCl~2/;>6kDQk!.oi&jQVdHlpM5<@`V89^{h-9D6.~y(6%?Y' );

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
