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
define( 'DB_NAME', 'day1cmd' );

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
define( 'AUTH_KEY',         'nhk:hu4j1I?PC6/2Ip,%plSRLwAMlB7a~|?#45Pen` 0P~~d(qwTNqZ,8S+D<$p=' );
define( 'SECURE_AUTH_KEY',  'pibZi !c?13nP>:3{h>bbeR[wwS[%nfxoa2,vJH1[&2_.H]cG#moZ@Et(#6[j78T' );
define( 'LOGGED_IN_KEY',    'Iui1V2m3 B3UV<rzb#(6zCk%vr7[&TEUHrojyX%q[FM`js(Wb`Ni~y56)3dKg0@p' );
define( 'NONCE_KEY',        ')xz6N~cwX;yPdVFqPC v+U jTB&Y4(f0Z%?X,io=<v]-t@B~F.vgmwK$pp?p{)HT' );
define( 'AUTH_SALT',        'f0uoOTToA9 )~pHr@QgAq65z(T$MPx=5czrHFwSi}JuQ&A-9b#)2DYHKS!6 ea9`' );
define( 'SECURE_AUTH_SALT', '{hSjoQ[AiDOQ]WK|lXS-<rs6a2@,-uGGW!8gqIg~1Ug[GTnK.$9,aRTXavUgh.}?' );
define( 'LOGGED_IN_SALT',   'iC;#]AG&}qO@t!qSE!]BPx^t>W^Pa [:=YrT+Z^y0J|,A$Z|31,Im:SfdidkWSZn' );
define( 'NONCE_SALT',       'qm%(JTi`SyAm9yNIn.k)=rcuV@L(d5B8tw6TRp.Vt~/APQBL[_Sx2vE>n4/9nLYx' );

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
