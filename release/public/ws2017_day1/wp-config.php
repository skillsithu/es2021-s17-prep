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
define( 'DB_NAME', 'ws2017_day1' );

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
define( 'AUTH_KEY',         ']#}LY]o_c~7gHhmb3GuBF5I;(cIB%xmECW&w(^Or[pn%I+-5.Mh{}lO=ZQ3 ,y:f' );
define( 'SECURE_AUTH_KEY',  ' QbM.1|o%]y;z|A}(55&:StQ*wohzsd;FbGF*QS>H=pI8Wf~9.cygqoHY:e6*of7' );
define( 'LOGGED_IN_KEY',    '@c(yl4_Xp%30}|RTIg8`JXL>jVjek}ra0c)_ sl9DD2b#q!X8.vOH-pjG~v/RsJR' );
define( 'NONCE_KEY',        'd@Ks=v3g^EAC0u&lJv4Kd0d1^<5}6KSV@f)BoUNR2S>kxhU@C1NWG!=d/_9!$[5w' );
define( 'AUTH_SALT',        '{GU7Kig($(7D}I_0Q[E/j&Mg}@4Y`%z~|OSCJ51sgqw@Kt4J;OGFD0;BBZnTSn6B' );
define( 'SECURE_AUTH_SALT', 'm;^=<yuO|E %1zz#q(&m8;%L1M]/mhpb#8nu?r6U_{cv- Q-8F W&O!)$Di- n>W' );
define( 'LOGGED_IN_SALT',   'fSwWTt}yg-T7d&sQ[afUrjHl;_KhrV]$:V39(%HxX2u}T[,qCHt5QQ]4/kYgJjJe' );
define( 'NONCE_SALT',       'wuM45ds;>-w@.gg}Q(O4thCtIE>ngh4Lu.+vznu.bYC6`IM Zy8UZ],UJ($(}-#[' );

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
